import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/transaction_logs/get_transaction_logs_data.dart';
import 'package:transaction_data/models/transaction_logs/get_transaction_logs_response.dart';
import 'package:widgets_library/scroller.dart';

import 'ViewLogsListItem.dart';

class ViewLogsScreen extends StatefulWidget {
  String title;
  int?approverID;

  ViewLogsScreen({
    required this.title,
    this.approverID
  });

  @override
  State<ViewLogsScreen> createState() => _ViewLogsScreenState();
}

class _ViewLogsScreenState extends State<ViewLogsScreen> {
  TextEditingController _dropdownHintCtr = TextEditingController();
  late NotificationBar _notificationBar;
  GetTransactionLogsResponse? _logs;
  List<GetTransactionLogsData>? _logsData;
  bool _isLoading = false;
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getTransactionLogs(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: Container(
          child: _notificationBar,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
            padding: EdgeInsets.all(SizeConfig.getSize(10)),
            child: WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Padding(
                  padding: const EdgeInsets.only(right: 0.0, bottom: 0.0),
                  child: Text(
                    widget.title.toUpperCase(),
                    style: theme.heading5?.copyWith(
                        fontSize: 19.0,
                        fontWeight: FontWeight.w700
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.zero,
                content: _widget(theme),
                actionsAlignment: MainAxisAlignment.center,
                actions: [],
              ),
            )).withLoader(isLoading: _isLoading,theme: theme),
      ),
    );
  }

  _widget(SemnoxTheme theme) {
    return Column(
      children: [
        Container(
          height: 1,
          color: theme.dividerColor,
        ),
        SizedBox(
          height: SizeConfig.getSize(10),
        ),
        Expanded(
          child: Scroller(
            controller:_horizontal,
            child: Padding(
              padding: const EdgeInsets.only(bottom : 24.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller:_horizontal,
                child: Scroller(
                  controller:_vertical,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: SingleChildScrollView(
                      controller:_vertical,
                      child: Container(
                        width:  MediaQuery.of(context).size.width * 1.35,
                        //height: 200,
                        child: Column(
                          children: [
                             Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.getSize(30)),
                                  child: Text(
                                            MessagesProvider.get('Activity Date'),
                                            style: theme.heading5
                                                ?.copyWith(fontSize: SizeConfig.getSize(18)),
                                            overflow: TextOverflow.ellipsis,
                                            ),
                                  ),
                                  Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.getSize(160)),
                                  child: Text(
                                        MessagesProvider.get('Login Id'),
                                        style: theme.heading5
                                            ?.copyWith(fontSize: SizeConfig.getSize(18)),
                                        overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                  Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.getSize(70)),
                                  child: Text(
                                        MessagesProvider.get('Action'),
                                        style: theme.heading5
                                            ?.copyWith(fontSize: SizeConfig.getSize(18)),
                                        overflow: TextOverflow.ellipsis,
                                        ),
                                  ),
                                  Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.getSize(190)),
                                  child: Text(
                                  MessagesProvider.get('Activity'),
                                  style: theme.heading5
                                      ?.copyWith(fontSize: SizeConfig.getSize(18)),
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                  ),
                                  Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.getSize(770)),
                                  child: Text(
                                  MessagesProvider.get('Approver Id'),
                                  style: theme.heading5
                                      ?.copyWith(fontSize: SizeConfig.getSize(18)),
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                  ),
                                  Padding(
                                  padding: EdgeInsets.only(left: SizeConfig.getSize(40)),
                                  child: Text(
                                  MessagesProvider.get('Approval Time'),
                                  style: theme.heading5
                                      ?.copyWith(fontSize: SizeConfig.getSize(18)),
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                  ),
                                ],
                                ),
                            ListView.builder(
                                shrinkWrap: true,
                                //controller:_vertical,
                                physics: const ScrollPhysics(),
                                itemCount: _logsData?.length ?? 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child:  LogsListItem(
                                      selectedIndex: _selectedIndex,
                                      index: index,
                                      data: _logsData,
                                      notificationBar: _notificationBar!,
                                      onChange: (value) {
                                        setState(() {
                                          _selectedIndex = value;
                                          //  _selectedData = _accountDetailsData?[_selectedIndex];
                                        });
                                      },
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          color: theme.dividerColor,
        ),
        SizedBox(
          height: SizeConfig.getSize(10),
        ),
        Container(
          // height:  MediaQuery.of(context).size.height,
          height: SizeConfig.getSize(60),
          width: MediaQuery.of(context).size.width * 0.10,
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0.0),
              backgroundColor: theme.button2BG1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
            ),
            child: Text(
              MessagesProvider.get('CLOSE'),
              style: theme.headingLight5?.copyWith(
                  color: Colors.white,
                  fontSize: SizeConfig.getFontSize(16),
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
    );
  }

  Future getTransactionLogs(BuildContext context) async {
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final transactionDataBl = await TransactionDataBuilder.build(execContext!);
    _logs = await transactionDataBl.getTransactionLogs();
    setState(() {
      _setLoadingStatus(false);
      _logsData = _logs?.data ?? [];
    });
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }
}
