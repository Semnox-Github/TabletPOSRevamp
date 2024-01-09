import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:transaction_ui/name_transaction_seat/loader_extension_widget.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../models/transaction_lines_group.dart';

class NameTransactionSeatDialog extends StatefulWidget {
  final String? seatName;
  final List<String>? seatNamesList;
  final List<TransactionLinesGroup>? transactionLines;
  final Function() onComplete;

  const NameTransactionSeatDialog({
    Key? key,
    required this.seatName,
    required this.seatNamesList,
    required this.transactionLines,
    required this.onComplete,
  }) : super(key: key);

  @override
  State<NameTransactionSeatDialog> createState() => _NameTransactionSeatDialogState();
}

class _NameTransactionSeatDialogState extends State<NameTransactionSeatDialog> {
  final _seatNameTextEditingController = TextEditingController();
  final _scrollController = ScrollController();
  NotificationBar? _notificationBar;
  bool _isLoading = false;
  String _loadingMessage = "";
  List<int> transactionLineIds = [];
  TransactionCubit? transactionCubit;
  late SemnoxTheme theme;

  @override
  void initState() {
    super.initState();
    _seatNameTextEditingController.text = widget.seatName ?? '';
    _notificationBar = NotificationBar(showHideSideBar: false);
    transactionCubit = context.read<TransactionCubit>();
    widget.transactionLines?.forEach((transactionLinesGroup) {
      transactionLinesGroup.transactionLines.forEach((lines) {
        transactionLineIds.add(lines.transactionLineId);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _notificationBar = null;
    _seatNameTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: theme.transparentColor,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                ),
                child: SizedBox(
                  width: SizeConfig.isBigDevice() ? SizeConfig.getHeight(420) : SizeConfig.getWidth(400),
                  height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(240) : SizeConfig.getHeight(320),
                  child: RawScrollbar(
                    radius: Radius.circular(SizeConfig.getSize(2)),
                    thumbVisibility: true,
                    mainAxisMargin: SizeConfig.getSize(3),
                    crossAxisMargin: SizeConfig.getSize(3),
                    trackVisibility: true,
                    trackBorderColor: theme.scrollBarHandle,
                    trackColor: theme.scrollArea,
                    thumbColor: theme.scrollBarHandle,
                    thickness: SizeConfig.getWidth(7),
                    controller: _scrollController,
                    child: CustomScrollView(controller: _scrollController, slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: [
                            SizedBox(
                              height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(60) : SizeConfig.getHeight(90),
                              child: Center(
                                child: Text(
                                  MessagesProvider.get("UPDATE SEAT"),
                                  style: theme.heading2?.copyWith(fontSize: SizeConfig.getFontSize(26)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Divider(
                              thickness: SizeConfig.getSize(1),
                              color: theme.dialogFooterInnerShadow,
                              height: SizeConfig.getHeight(1),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: SizeConfig.getHeight(24.0),
                                    right: SizeConfig.getHeight(24.0),
                                    top: SizeConfig.getWidth(15.0),
                                    bottom: SizeConfig.getWidth(15.0)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      MessagesProvider.get("Seat Name"),
                                      style: theme.headingLight5?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20)),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(height: SizeConfig.getHeight(10),),
                                    SizedBox(
                                      height:SizeConfig.getSize(52),
                                      child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(40)
                                          ],
                                          controller: _seatNameTextEditingController,
                                          style: theme.subtitle3?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                          decoration: InputDecoration(
                                            fillColor: theme.primaryColor,
                                            filled: true,
                                            contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(10), bottom: SizeConfig.getSize(10), right: SizeConfig.getSize(10), left: SizeConfig.getSize(10)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                borderSide:  BorderSide(
                                                  width: SizeConfig.getSize(1),
                                                  color: theme.secondaryColor!,
                                                )),
                                            border:  OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                borderSide:  BorderSide(
                                                  width: SizeConfig.getSize(1),
                                                  color: theme.secondaryColor!,
                                                )),
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Divider(
                              thickness: SizeConfig.getSize(1),
                              color: theme.dialogFooterInnerShadow,
                              height: SizeConfig.getHeight(1),
                            ),
                            SizedBox(
                              height: SizeConfig.isBigDevice() ? SizeConfig.getHeight(75) : SizeConfig.getHeight(90),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SecondaryLargeButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    text: MessagesProvider.get("CANCEL"),
                                  ),
                                  SizedBox(width: SizeConfig.getWidth(10),),
                                  PrimaryLargeButton(
                                    text: MessagesProvider.get("OK"),
                                    onPressed: () async {
                                      if(FocusScope.of(context).hasFocus) {
                                        FocusScope.of(context).unfocus();
                                      }
                                      _updateTransactionSeatName();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ]
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).withLoader(
        isLoading: _isLoading,
        message: _loadingMessage,
        theme: theme
      ),
    );
  }

  Future<void> _updateTransactionSeatName() async {
    try {
      if (_seatNameTextEditingController.text.isNotEmpty) {
        if(_seatNameTextEditingController.text.length <= 30) {
          _setLoadingStatus(true, MessagesProvider.get("Please wait while we update the seat name..."));
          if (widget.seatNamesList?.contains(_seatNameTextEditingController.text) == true) {
            _setLoadingStatus(false, null);
            _notificationBar?.showMessage(
                MessagesProvider.get("Seat Name already exist."),
                theme.footerBG5!);
          } else {
            final TransactionCubit transactionCubit = context.read<TransactionCubit>();
            var execContextBL = await ExecutionContextBuilder.build();
            var execContextDTO = execContextBL.getExecutionContext();
            var transactionDataBl = await TransactionDataBuilder.build(execContextDTO!);
            TransactionResponse response = await transactionDataBl.updateTransactionLinesSeat(
                transactionLineIds,
                _seatNameTextEditingController.text,
                transactionCubit.state.selectedSeat.toString());
            var isSeatNameUpdated = await transactionCubit.updateTransactionSeatName(response.data);
            _setLoadingStatus(false, null);
            if(isSeatNameUpdated) {
              Navigator.pop(context);
              widget.onComplete();
            } else {
              _notificationBar?.showMessage(transactionCubit.state.transactionSeatNameUpdateError ?? "", (theme.textField1Error)!);
            }
          }
        } else {
          _notificationBar?.showMessage(
              MessagesProvider.get("Seat Name cannot be more than 30 characters"),
              theme.footerBG5!);
        }
      } else {
        _notificationBar?.showMessage(MessagesProvider.get("Please enter the seat name"), theme.footerBG5!);
      }
    } on DioError catch (error) {
      _setLoadingStatus(false, null);
      var errorString = error.response?.data['data'] as String?;
      _notificationBar?.showMessage(errorString!, (theme.textField1Error)!);
    } catch (error) {
      _setLoadingStatus(false, null);
      _notificationBar?.showMessage(error.toString(), (theme.textField1Error)!);
    }
  }

  void _setLoadingStatus(bool status, String? message) {
    setState(() {
      _isLoading = status;
      _loadingMessage = message ?? _loadingMessage;
    });
  }
}
