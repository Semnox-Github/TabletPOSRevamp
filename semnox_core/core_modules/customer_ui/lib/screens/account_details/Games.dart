import 'package:customer_data/models/account_details/account_details_data.dart';
import 'package:customer_data/models/account_details/account_game_dto.dart';
import 'package:customer_ui/ListViewItems/account_details/GameItem.dart';
import 'package:customer_ui/ListViewItems/account_details/GameItemHeader.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/widgets/account_details/AccountSearchFilter.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../../widgets/account_details/AccountsTopBar.dart';
import 'package:provider/provider.dart';

class Games extends StatefulWidget{

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  AccountDetailsData? accountsData;
  bool _nonZeroBalance = true;
  bool _currentEffective = true;
  bool _memberShipReward = false;
  int _selectedIndex = 0;
  bool _showData = false;
  var _gameProfileContainer;
  var _gameContainer;
  List<AccountGameDTO>? _data;
  String? _dateFormat;

  final ScrollController _gameHorizontalScrollController = ScrollController();
  final ScrollController _gameScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getConfigurations(context);
    _initGames();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    accountsData = context.watch<SelectedCardDetails>().selectedData;
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      body:  _showData == false ?
      const Center(child: CircularProgressIndicator(),) :
      Container(
        //height: MediaQuery.of(context).size.height,
        //constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height*0.90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AccountsTopBar(accountsData : accountsData),
            const SizedBox(height: 8.0,),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: AccountsSearchFilter(
                nonZeroBalance: _nonZeroBalance,
                currentEffective: _currentEffective,
                membershipReward: _memberShipReward,
                onChangeNonZeroBalance: (value){
                  setState(() {
                    _nonZeroBalance = value;
                    _addSearchFilter();
                  });
                },
                onChangeCurrentEffective: (value){
                  setState(() {
                    _currentEffective = value;
                    _addSearchFilter();
                  });
                },
                onChangeMembershipReward: (value){
                  setState(() {
                    _memberShipReward = value;
                    _addSearchFilter();
                  });
                },),
            ),
            const SizedBox(height: 8.0,),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Divider(),
            ),
            Expanded(child:  Scroller(
              controller:_gameHorizontalScrollController,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller:_gameHorizontalScrollController,
                  child: Scroller(
                    controller:_gameScrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: SingleChildScrollView(
                        child: Container(
                          width: 2200,
                          margin: const EdgeInsets.only(bottom: 10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: GameItemHeader(),
                              ),
                              const SizedBox(height: 4.0,),
                              Scroller(
                                controller:_gameScrollController,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      controller:_gameScrollController,
                                      physics: const ScrollPhysics(),
                                      itemCount: _data?.length ?? 0,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: GameItem(
                                            dateFormat: _dateFormat,
                                            selectedIndex: _selectedIndex,
                                            index: index,
                                            data: _data?[index],
                                            gameProfileContainer: _gameProfileContainer,
                                            gameContainer: _gameContainer,
                                            onChange: (value){
                                              setState((){
                                                _selectedIndex = value;
                                                //_selectedData = _data?[_selectedIndex];
                                              });
                                            },
                                          ),
                                        );
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )),

          ],
        ),
      ),
    );
  }

  _initGames() async {
    Log.printMethodStart('_initGames()', 'Games Screen','init');
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var gameProfileContainerResponse = await masterDataBL.getGameProfileContainer();
    _gameProfileContainer = gameProfileContainerResponse?.data?.gameProfileContainerDTOList;
    var gameContainerResponse = await masterDataBL.getGameContainer();
    _gameContainer = gameContainerResponse?.data?.gameContainerDTOList;
    Log.v("game profile count ${_gameProfileContainer?.length}");
    Log.v("game count ${_gameContainer?.length}");
    _addSearchFilter();
    Log.printMethodEnd('_initGames()', 'Games Screen','init');
  }

  void _addSearchFilter() {
    setState(() {
      _showData = true;
      List<AccountGameDTO>? data = List.from(accountsData?.accountGameDTOList ?? []);
      data.sort((a,b) => DateTime.parse(b.creationDate).compareTo(DateTime.parse(a.creationDate)));

      if(_memberShipReward){
        data.removeWhere((element) =>
        element.membershipRewardsId == -1);
      }
      if(_nonZeroBalance){
        data.removeWhere((element) =>
        element.balanceGames <= 0);
      }

      if(_currentEffective){
        data.removeWhere((element) => checkCurrentEffective(element.fromDate,element.expiryDate,element.obligationStatus));
      }
      _data = data;
    });
  }

  checkCurrentEffective(String? expiryDate, String? creationDate, String? obligationStatus) {
    if((expiryDate != null ? _isDateGreater(expiryDate): false) && obligationStatus == 'ACTIVATED' && (creationDate != null ? _isDateSmaller(creationDate) : true)){
      return true;
    }else{
      return false;
    }
  }


  bool _isDateGreater(String date){
    DateTime dt1 = DateTime.parse(date); //from
    DateTime dt2 = DateTime.now();
    return dt1.compareTo(dt2) > 0 ? true: false;
  }

  bool _isDateSmaller(String date){
    DateTime dt1 = DateTime.parse(date); //from
    DateTime dt2 = DateTime.now();
    return dt1.compareTo(dt2) < 0 ? true: false;
  }

  Future _getConfigurations(BuildContext context) async {
    var execContextBL = await ExecutionContextBuilder.build();
    var sysExecContext = execContextBL.getExecutionContext();
    var masterDataBl = await MasterDataBuilder.build(sysExecContext!);
    _dateFormat = await masterDataBl.getDefaultValuesByName(defaultValueName: "DATETIME_FORMAT");
    _dateFormat = _dateFormat?.replaceAll('tt', 'a');
  }
}