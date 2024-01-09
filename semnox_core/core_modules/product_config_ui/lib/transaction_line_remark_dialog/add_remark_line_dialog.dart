import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/transaction_line_remark_dialog/cubit/transaction_line_remark_cubit.dart';
import 'package:product_config_ui/transaction_line_remark_dialog/cubit/transaction_line_remark_state.dart';
import 'package:product_config_ui/utils/constants.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../widgets/primaryLargeButton.dart';
import '../widgets/secondaryLargeButton.dart';

class TransactionLineRemarkDialog extends StatelessWidget {
  final String remarks;
  final Function onComplete;
  final List<int> transactionLineIds;
  final String? productName;
  final int?approverID;

  const TransactionLineRemarkDialog(
      {Key? key,
      required this.remarks,
      required this.onComplete,
      required this.transactionLineIds,
      required this.productName,
      this.approverID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TransactionLineRemarkDialogCubit>(
              create: (BuildContext context) =>
                  TransactionLineRemarkDialogCubit()),
        ],
        child: AddRemarkLineDialog(
            approverID:approverID,
            remarks: remarks,
            onComplete: onComplete,
            transactionLineIds: transactionLineIds,
            productName: productName));
  }
}

class AddRemarkLineDialog extends StatefulWidget {
  final String remarks;
  final Function onComplete;
  final List<int> transactionLineIds;
  final String? productName;
  final int?approverID;

  const AddRemarkLineDialog(
      {Key? key,
        required this.remarks,
        required this.onComplete,
        required this.transactionLineIds,
        required this.productName,
        this.approverID})
      : super(key: key);

  @override
  State<AddRemarkLineDialog> createState() => _AddRemarkLineDialogState();
}

class _AddRemarkLineDialogState extends State<AddRemarkLineDialog> {
  final _remarkTextController = TextEditingController();
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;

  @override
  void initState() {
    super.initState();
    _resetLoaderAndMessage();
    _remarkTextController.text = widget.remarks;
  }

  _resetLoaderAndMessage() {
    final transactionLineRemarkState =
        context.read<TransactionLineRemarkDialogCubit>();
    transactionLineRemarkState.resetLoaderAndMessage();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
        ),
        child: SizedBox(
          height: SizeConfig.getSize(310),
          width: SizeConfig.getWidth(420),
          child: Scrollbar(
            radius:  Radius.circular(SizeConfig.getSize(8)),
            thumbVisibility: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding:  EdgeInsets.all(SizeConfig.getSize(10)),
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.all(SizeConfig.getSize(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            MessagesProvider.get('Add Remarks').toUpperCase(),
                            style:_theme.heading2!.copyWith(fontSize: SizeConfig.getFontSize(26)),
                          ),
                           SizedBox(height:SizeConfig.getSize(10)),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: _theme.dialogFooterInnerShadow,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         SizedBox(height: SizeConfig.getSize(30)),
                        SizedBox(
                          height: SizeConfig.getSize(52),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(51),
                            ],
                            controller: _remarkTextController,
                            style: _theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                            decoration: InputDecoration(
                              fillColor: _theme.primaryColor,
                              filled: true,
                              hintText: MessagesProvider.get("Enter Text"),
                              hintStyle:_theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                              contentPadding:  EdgeInsets.only(
                                  top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(5), left: SizeConfig.getSize(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                  borderSide:  BorderSide(
                                    width: SizeConfig.getSize(1),
                                    color: _theme.secondaryColor!,
                                  )),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                  borderSide:  BorderSide(
                                    width: SizeConfig.getSize(1),
                                    color: _theme.secondaryColor!,
                                  )),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                borderSide:  BorderSide(
                                  width: SizeConfig.getSize(1),
                                  color: _theme.secondaryColor!,
                                ),
                              ),
                            ),
                          ),
                        ),
                         SizedBox(height: SizeConfig.getSize(10)),
                        BlocBuilder<TransactionLineRemarkDialogCubit,
                                TransactionLineRemarkDialogState>(
                            builder: (context, transactionRemarkState) {
                          if (transactionRemarkState.isError) {
                            return Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                              child: Text(
                                transactionRemarkState.statusMessage ?? '',
                                style:  TextStyle(
                                  color:_theme.textField1Error,
                                  fontSize: 13.0,
                                ),
                              ),
                            );
                          }
                          return  SizedBox(
                            height: SizeConfig.getSize(20),
                          );
                        }),
                        Container(
                          height: 1,
                          color: _theme.dialogFooterInnerShadow,
                        ),
                        SizedBox(height: SizeConfig.getSize(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondaryLargeButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: MessagesProvider.get("Cancel").toUpperCase(),
                            ),
                            const SizedBox(width: 10),
                            PrimaryLargeButton(
                              text: MessagesProvider.get("OK").toUpperCase(),
                              onPressed: () async {
                                if (_validateTextField()) {
                                  FocusManager.instance.primaryFocus
                                      ?.unfocus();
                                  loader.showLoaderDialog(
                                      context,
                                      MessagesProvider.get(
                                          "Please wait while we update the remarks..."));
                                  final transactionLineRemarkState =
                                  context.read<
                                      TransactionLineRemarkDialogCubit>();
                                  await transactionLineRemarkState
                                      .addRemarksToTransactionLineGroups(
                                      approverID:widget.approverID,
                                      _remarkTextController.text
                                          .trim()
                                          .replaceAll(
                                          AppConstants
                                              .removeLeadingAndTrailingSpaces,
                                          ' '),
                                      widget.transactionLineIds);
                                  if (transactionLineRemarkState
                                      .state.isSuccess) {
                                    loader.hideLoaderDialog(context);
                                    Navigator.pop(context);
                                    context
                                        .read<TransactionCubit>()
                                        .onTransactionDataUpdated(
                                        transactionLineRemarkState.state
                                            .transactionResponse!.data);
                                    widget.onComplete(
                                        "${MessagesProvider.get("Updated the remarks successfully for product &1.",['${widget.productName ?? ''}'])}");
                                  } else {
                                    loader.hideLoaderDialog(context);
                                  }
                                }
                              },
                            ),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  bool _validateTextField(){
    if ((_remarkTextController.text.trim() != '') &&_remarkTextController.text.length > 50) {
      _showErrorDialog(MessagesProvider.get(
          "A maximum of 50 characters is allowed for remarks"));
      return false;
    } else if ((_remarkTextController.text.trim() != '')&& !AppConstants
        .alphanumericRegExpWithSpecialChar
        .hasMatch(_remarkTextController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get(
          "Remarks should not contain any special characters"));
      return false;
    } else if ((_remarkTextController.text.trim() == '')&& _remarkTextController.text.isNotEmpty) {
      _showErrorDialog((
          "Empty spaces are not allowed!"));
      return false;
    }else{
      return true;
    }
  }


  _showErrorDialog(String message){
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext newContext) {
          return ErrorAlertDialog(title: 'Error',message:message ,
          );
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _remarkTextController.dispose();
  }
}
