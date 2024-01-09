import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/change_staff_dialog/loader_widget_extension.dart';
import 'package:product_config_ui/reverse_transaction_transaction_line/reversal_reason_data.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/transaction_receipt/transaction_print_receipt_response.dart';
import 'package:transaction_data/transaction_data_bl.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../widgets/primaryLargeButton.dart';
import '../widgets/secondaryLargeButton.dart';

class ReverseObligationsDialog extends StatefulWidget {
  final bool isTransactionReversal;
  final List<int> transactionLinesIds;
  final ReversalReasonData data;
  final Function(TransactionResponse response, TransactionPrintReceiptResponse? receipt) onReversed;
  final Function(String message) onReversalError;
  final int? approverID;

  const ReverseObligationsDialog({
    Key? key,
    required this.isTransactionReversal,
    required this.transactionLinesIds,
    required this.data,
    required this.onReversed,
    required this.onReversalError,
    required this.approverID
  }) : super(key: key);

  @override
  State<ReverseObligationsDialog> createState() => _ReverseObligationsDialogState();
}

class _ReverseObligationsDialogState extends State<ReverseObligationsDialog> {
  NotificationBar? _notificationBar;
  bool _isLoading = false;
  String _loadingMessage = "";
  late TransactionDataBLContract _transactionDataBl;
  late SemnoxTheme theme;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
  }

  @override
  void dispose() {
    super.dispose();
    _notificationBar = null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    theme = Theme.of(context).extension<SemnoxTheme>()!;
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
                  height: SizeConfig.getHeight(312),
                  width: SizeConfig.getWidth(572),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.getHeight(98),
                        child: Center(
                          child: Text(
                              MessagesProvider.get("REVERSE OBLIGATIONS"),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(26)),),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: SizeConfig.getWidth(30), right: SizeConfig.getWidth(30)),
                          child: Center(
                            child: Text(
                              MessagesProvider.get(widget.isTransactionReversal
                                  ? "Do you want to reverse entitlements loaded as part of this Transaction?"
                                  : "Do you want to reverse entitlements loaded as part of this Transaction Line?"),
                              style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      SizedBox(
                        height: SizeConfig.getHeight(98),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondaryLargeButton(
                              onPressed: () {
                                widget.isTransactionReversal ? _reverseTransaction(false) : _reverseTransactionLine(false);
                              },
                              text: MessagesProvider.get("NO"),
                            ),
                            SizedBox(width: SizeConfig.getWidth(10)),
                            PrimaryLargeButton(
                              onPressed: () {
                                widget.isTransactionReversal ? _reverseTransaction(true) : _reverseTransactionLine(true);
                              },
                              text: MessagesProvider.get("YES"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ).withLoader(
        isLoading: _isLoading,
        message: _loadingMessage,
        theme: theme
      ),
    );
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  void _reverseTransactionLine(bool isReverseObligation) async{
    try {
      _loadingMessage = MessagesProvider.get("Reversing the selected transaction line...");
      _setLoadingStatus(true);
      var executionContextBL = await ExecutionContextBuilder.build();
      var executionContext = executionContextBL.getExecutionContext();
       _transactionDataBl = await TransactionDataBuilder.build(executionContext!);

      final response = await _transactionDataBl.reverseTransactionLine(
          approverID:widget.approverID,
          widget.transactionLinesIds, widget.data.reasonId!, widget.data.remarks!, isReverseObligation, true);
      _setLoadingStatus(false);
      if (response.exception == null) {
        Navigator.pop(context);
        widget.onReversed(response, null);
      } else {
        _notificationBar?.showMessage(response.exception!, theme.footerBG3!);
      }
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      _notificationBar?.showMessage(errorString!, theme.footerBG3!);
    } catch (error) {
      _setLoadingStatus(false);
      _notificationBar?.showMessage(error.toString(), theme.footerBG3!);
    }
  }

  void _reverseTransaction(bool isReverseObligation) async{
    try {
      final trxCubit = context.read<TransactionCubit>();
      TransactionPrintReceiptResponse? receipt;
      final currentTrxStatus = trxCubit.transactionResponse?.data?.transactionStatus;
      _loadingMessage = MessagesProvider.get("Reversing the transaction...");
      _setLoadingStatus(true);
      var executionContextBL = await ExecutionContextBuilder.build();
      var executionContext = executionContextBL.getExecutionContext();
      _transactionDataBl = await TransactionDataBuilder.build(executionContext!);
      final response = await _transactionDataBl.reverseTransaction(
          widget.data.reasonId!, widget.data.remarks!, isReverseObligation, true, approverID: widget.approverID);
      if(currentTrxStatus == 'ORDERED') {
        receipt = await _transactionDataBl.getTransactionPrintReceipt(format: "Image");
      }
      _setLoadingStatus(false);
      if (response.exception == null) {
        Navigator.pop(context);
        widget.onReversed(response, receipt);
      } else {
        Navigator.pop(context);
        _notificationBar?.showMessage(response.exception!, theme.footerBG3!);
      }
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      Navigator.pop(context);
      widget.onReversalError(errorString!);
    } catch (error) {
      _setLoadingStatus(false);
      Navigator.pop(context);
      widget.onReversalError(error.toString());
    }
  }
}
