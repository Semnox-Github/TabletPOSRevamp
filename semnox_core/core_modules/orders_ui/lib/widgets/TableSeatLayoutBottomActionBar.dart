import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logs_data/logger.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:orders_data/blocs/app_blocs.dart';
import 'package:orders_data/blocs/app_events.dart';
import 'package:orders_data/blocs/app_states.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/repos/repositories.dart';
import 'package:orders_ui/utils/AppColors.dart';
import 'package:orders_ui/widgets/StatusInfoDialog.dart';
import 'dart:math' as math;

ValueNotifier<String> selectedTableIdOuter = ValueNotifier('');

class TableSeatLayoutBottomActionBar extends StatefulWidget {
  const TableSeatLayoutBottomActionBar({Key? key}) : super(key: key);

  @override
  State<TableSeatLayoutBottomActionBar> createState() => _TableSeatLayoutBottomActionBarState();
}

class _TableSeatLayoutBottomActionBarState extends State<TableSeatLayoutBottomActionBar> {

  late NotificationBar _notificationBar;
  bool showOrderModeButtons = false;
  final ScrollController _controller = ScrollController();
  final ScrollController _vControllerInside = ScrollController();
  final ScrollController _vController = ScrollController();
  String pressed = 'min';
  String pressedInPopUp = 'min';
  int selectedTableId = 0;
  int tempSelectedTableId = 0;
  var tmp = "";
  var value1; var value2; var value3;
  var selectedRowOuterLayout = 0;
  var selectedColumnOuterLayout = 0;
  int selectedFacilityIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedFacilityIndex = 0;
      showOrderModeButtons = false;
    });
    _notificationBar = NotificationBar(showHideSideBar: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10,),
            InkWell(
              onTap: (){
                setState(() {
                  showOrderModeButtons = !showOrderModeButtons;
                });
              },
              child: Container(
                width: 80,
                height: 60,
                decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Center(
                  child: Text(showOrderModeButtons == false ? "ORDER\nMODE" : "ACTION\nMODE",
                    style: GoogleFonts.robotoCondensed(
                        color: AppColors.primaryColor,
                        fontSize: 12,fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Center(
                child: Text("REFRESH",
                  style: GoogleFonts.robotoCondensed(
                      color: AppColors.primaryColor,
                      fontSize: 12,fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            showOrderModeButtons == false ? Container() :
            BlocProvider(
                create: (context) => FacilityBloc(

                )..add(LoadFacilityEvent()),
                child: BlocBuilder<FacilityBloc, FacilityState>(
                  builder: (context, state){
                    if(state is FacilityLoadedState){

                      return Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width/1.9,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: ScrollPhysics(),
                          children: [
                            const SizedBox(width: 5,),
                            InkWell(
                              onTap: (){

                              },
                              child: Center(
                                child: Stack(
                                  children: [
                                    Icon(Icons.arrow_back_ios_new,color: AppColors.buttonShadowColor,size: 15,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(Icons.arrow_back_ios_new,color: AppColors.buttonShadowColor,size: 15,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            ValueListenableBuilder(
                                valueListenable: selectedTableIdOuter,
                                builder: (BuildContext context, String newValue, Widget? child){
                                  return InkWell(
                                    onTap: (){
                                      if(selectedTableIdOuter.value == ''){

                                      }else{
                                        final _listRow = [];
                                        final _listColumn = [];
                                        final _listOfNames = [];
                                        var ascRowList = [];
                                        var ascColumnList = [];

                                        print("||||| ${selectedTableIdOuter.value} |||||");
                                        Log.v(state.facilities.toString());
                                        List<FacilityContainerDTO> facilitiesList = state.facilities;

                                        print('TEST: ${facilitiesList.length}');
                                        var listOfTables = facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList;
                                        print("selected facility table list length : "+listOfTables.length.toString());


                                        for(int i=0; i < facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList.length; i++){
                                          _listRow.add(facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList[i].rowIndex);
                                          _listColumn.add(facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList[i].columnIndex);
                                          _listOfNames.add(facilitiesList[selectedFacilityIndex].facilityTableContainerDTOList[i].tableName);
                                          print("+++++++++++++++");
                                          print(_listRow);
                                          print(_listColumn);
                                          print(_listOfNames);
                                          print(_listRow.reduce((curr, next) => curr > next? curr: next));
                                          print(_listColumn.reduce((curr, next) => curr > next? curr: next));
                                          print("row list length : "+_listRow.length.toString());
                                          print("column list length : "+_listColumn.length.toString());
                                          print(listOfTables);
                                          print("+++++++++++++++");
                                        }

                                        if(_listRow.isNotEmpty && _listColumn.isNotEmpty){
                                          ascRowList = [for(var i=0; i<(_listRow.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                                          ascColumnList = [for(var i=0; i<(_listColumn.reduce((curr, next) => curr > next? curr: next)+1); i+=1) i];
                                        }else{

                                        }

                                        print(" ##### "+ascRowList.toString()+" \n##### "+ascColumnList.toString()+" \n##### ");

                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return Center(
                                                  child: AlertDialog(
                                                    insetPadding: EdgeInsets.only(top: 40, bottom: 45),
                                                    title: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("Merge to...",
                                                          style: GoogleFonts.robotoCondensed(
                                                            color: Colors.black,
                                                            fontSize: 15,
                                                            fontWeight: FontWeight.w600,
                                                          ),
                                                        ),
                                                        Divider(),
                                                        Align(
                                                          alignment: Alignment.centerRight,
                                                          child: InkWell(
                                                              onTap: (){
                                                                showDialog(
                                                                  context: context,
                                                                  builder: (BuildContext context) {
                                                                    return StatusInfoDialog([]);
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(Icons.info_outline,color: AppColors.blackColor,size: 20,)),
                                                        ),
                                                      ],
                                                    ),
                                                    content: Stack(
                                                      children: [
                                                        Container(
                                                          height: MediaQuery.of(context).size.height,
                                                          width: 500,
                                                          child: ListView(
                                                            controller: _vControllerInside,
                                                            scrollDirection: Axis.vertical,
                                                            children: [
                                                              for (var i in ascRowList) //Row
                                                                Row(
                                                                  children: [ for (var j in ascColumnList) //column
                                                                    Stack(
                                                                      children: [
                                                                        SizedBox(
                                                                          width: 35,
                                                                          height: 35,
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(2.0),
                                                                            child: InkWell(
                                                                              onTap: () {
                                                                                print("Column: $j");
                                                                                print("Row: $i");
                                                                                print(195 - (_listOfNames.length));
                                                                                setState((){
                                                                                  selectedTableId = j; tempSelectedTableId = i;
                                                                                  tmp = listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                      element.columnIndex == i).tableName.toString();
                                                                                });
                                                                                // selectedTableId = listOfTables.firstWhere((element) => element['RowIndex'] == j &&
                                                                                //     element['ColumnIndex'] == i)['TableId'];
                                                                                // tempSelectedTableId = listOfTables.firstWhere((element) => element['RowIndex'] == j &&
                                                                                //     element['ColumnIndex'] == i)['TableName'];

                                                                                // OrdersPage.pressedTable.value = listOfTables.firstWhere((element) => element['RowIndex'] == j &&
                                                                                //     element['ColumnIndex'] == i)['TableName'].toString();

                                                                                print("selectedTableId : "+selectedTableId.toString());
                                                                                print("table id clicked : "+tempSelectedTableId.toString());
                                                                                print("%%%%%%%%%%"+listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                    element.columnIndex == i).tableName.toString());
                                                                              },
                                                                              child: (selectedTableId == j) && tempSelectedTableId == i ? Container(
                                                                                height: 20,
                                                                                width: 20,
                                                                                color: Colors.black.withOpacity(0.3),
                                                                                child: Center(
                                                                                  child: Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                      element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                      element.columnIndex == i).tableName : "",
                                                                                    style: GoogleFonts.robotoCondensed(
                                                                                        color: Colors.white,
                                                                                        fontSize: 10,
                                                                                        fontWeight: FontWeight.w600
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ) : Container(
                                                                                height: 20,
                                                                                width: 20,
                                                                                color: (listOfTables.any((element) => element.rowIndex == j &&
                                                                                    element.columnIndex == i)) ? Colors.green : Colors.white,
                                                                                child: Center(
                                                                                  child: Text(listOfTables.any((element) => element.rowIndex == j &&
                                                                                      element.columnIndex == i) ? listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                                                      element.columnIndex == i).tableName : "",
                                                                                    style: GoogleFonts.robotoCondensed(
                                                                                        color: Colors.white,
                                                                                        fontSize: 10,
                                                                                        fontWeight: FontWeight.w600
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        // selectedTableId == tempSelectedTableId ? Container(
                                                                        //   width: 35,
                                                                        //   height: 35,
                                                                        //   color: Colors.white.withOpacity(0.4),
                                                                        // ) : Container(),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(top: 3, left: 27),
                                                                          child: Align(
                                                                            alignment: Alignment.topRight,
                                                                            child: Text("F",
                                                                              style: GoogleFonts.robotoCondensed(
                                                                                  color: Colors.white,
                                                                                  fontSize: 8.0,
                                                                                  fontStyle: FontStyle.normal,
                                                                                  fontWeight: FontWeight.w600
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(top: 0, right: 0),
                                                          child: Align(
                                                            alignment: Alignment.centerRight,
                                                            child: Column(
                                                              children: [
                                                                InkWell(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      pressedInPopUp = 'min';
                                                                    });
                                                                    _vControllerInside.animateTo(
                                                                      _controller.position.minScrollExtent,
                                                                      duration: Duration(seconds: 2),
                                                                      curve: Curves.fastOutSlowIn,
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    width: 25, height: 30,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(10),
                                                                          topRight: Radius.circular(10),
                                                                        ),
                                                                        border: Border.all(color: pressedInPopUp == 'max' ? Colors.black : Colors.grey)
                                                                    ),
                                                                    child: Center(child: Transform.rotate(
                                                                        angle: math.pi / 2,
                                                                        child: Icon(Icons.arrow_back_ios_new,
                                                                          color: pressedInPopUp == 'max' ? Colors.black : AppColors.buttonShadowColor,size: 20,)),),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 25, height: MediaQuery.of(context).size.height/4,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors.white,
                                                                      border: Border.all(color: Colors.grey)
                                                                  ),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: Align(
                                                                      alignment: pressed == 'min' ? Alignment.topCenter :
                                                                      Alignment.bottomCenter,
                                                                      child: Container(
                                                                        width: 50, height: MediaQuery.of(context).size.height/5,
                                                                        color: Color(0xffD1D3D8),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: (){
                                                                    setState(() {
                                                                      pressedInPopUp = 'max';
                                                                    });
                                                                    _vControllerInside.animateTo(
                                                                      _controller.position.maxScrollExtent,
                                                                      duration: Duration(seconds: 2),
                                                                      curve: Curves.fastOutSlowIn,
                                                                    );
                                                                  },
                                                                  child: Container(
                                                                    width: 25, height: 30,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        borderRadius: BorderRadius.only(
                                                                          bottomLeft: Radius.circular(10),
                                                                          bottomRight: Radius.circular(10),
                                                                        ),
                                                                        border: Border.all(
                                                                            color: pressedInPopUp == 'min' ? Colors.black : Colors.grey)
                                                                    ),
                                                                    child: Center(child: Transform.rotate(
                                                                        angle: -math.pi / 2,
                                                                        child: Icon(Icons.arrow_back_ios_new,
                                                                          color: pressedInPopUp == 'min' ? Colors.black : AppColors.buttonShadowColor,
                                                                          size: 20,)),),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      Divider(),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                              // OrdersPage.pressedTable.value = '';
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Container(
                                                              width: 80,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.grey.shade200,
                                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                                              ),
                                                              child: Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text("CANCEL",
                                                                    textAlign: TextAlign.center,
                                                                    style: GoogleFonts.robotoCondensed(
                                                                        color: Colors.black,
                                                                        fontSize: 14,fontWeight: FontWeight.w600
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 10,),
                                                          InkWell(
                                                            onTap: (){
                                                              // // OrdersPage.pressedTable.value = tmp;
                                                              // print("*****"+listOfTables.firstWhere((element) => element.rowIndex == j &&
                                                              //     element.columnIndex == i).tableName.toString()+"*****");
                                                              // // print("&&&&&&& "+OrdersPage.pressedTable.value.toString()+" &&&&&&");
                                                              Navigator.of(context).pop();
                                                            },
                                                            child: Container(
                                                              width: 80,
                                                              height: 30,
                                                              decoration: BoxDecoration(
                                                                  color: AppColors.blackColor,
                                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                                              ),
                                                              child: Center(
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Text("OK",
                                                                    textAlign: TextAlign.center,
                                                                    style: GoogleFonts.robotoCondensed(
                                                                        color: Colors.white,
                                                                        fontSize: 14,fontWeight: FontWeight.w600
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Container(
                                      width: 80,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: Center(
                                        child: Text("MERGE",
                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.white,
                                              fontSize: 12,fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: Center(
                                child: Text("UNMERGE",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 12,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: Center(
                                child: Text("MOVE",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 12,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: Center(
                                child: Text("DETAILS",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 12,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: Center(
                                child: Text("RESERVE",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 12,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: Center(
                                child: Text("BLOCK",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 12,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            Container(
                              width: 80,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(5))
                              ),
                              child: Center(
                                child: Text("CLEAR",
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.white,
                                      fontSize: 12,fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 5,),
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                )
            ),
            const SizedBox(width: 10,),
            showOrderModeButtons == false ? Container() : InkWell(
              onTap: (){

              },
              child: Center(
                child: Stack(
                  children: [
                    Icon(Icons.arrow_forward_ios,color: AppColors.buttonShadowColor,size: 15,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Icon(Icons.arrow_forward_ios,color: AppColors.buttonShadowColor,size: 15,),
                    ),
                  ],
                ),
              ),
            ),
            showOrderModeButtons == false ? Container() : const SizedBox(width: 5,),
          ],
        ),
      ),
    );
  }
}
