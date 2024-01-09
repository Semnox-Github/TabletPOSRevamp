import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/transaction_line_course_dialog/cubit/transaction_line_set_course_cubit.dart';
import 'package:product_config_ui/transaction_line_course_dialog/cubit/transaction_line_set_course_state.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_ui/cubit/transaction_cubit.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../utils/constants.dart';
import '../widgets/primaryLargeButton.dart';

class TransactionLineCourseDialog extends StatelessWidget {
  const TransactionLineCourseDialog(
      {Key? key,
        this.approverID,
      required this.courseName,
        required this.productName,
      required this.onComplete,
      required this.lineRemarks,
      required this.transactionLineIds})
      : super(key: key);
  final String courseName;
  final String? lineRemarks;
  final List<int> transactionLineIds;
  final Function(String value) onComplete;
  final String productName;
  final int?approverID;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransactionLineSetCourseCubit>(
            create: (BuildContext context) =>
                TransactionLineSetCourseCubit()),
      ],
      child: LineCourseDialog(
          approverID:approverID,
        courseName: courseName,
        lineRemarks: lineRemarks,
        transactionLineIds: transactionLineIds,
        onComplete: onComplete,
          productName:productName
      ),
    );
  }
}

class LineCourseDialog extends StatefulWidget {
  const LineCourseDialog(
      {Key? key,
      this.approverID,
      required this.courseName,
      required this.productName,
      required this.onComplete,
      required this.lineRemarks,
      required this.transactionLineIds})
          : super(key: key);
      final String courseName;
      final String? lineRemarks;
      final List<int> transactionLineIds;
      final Function(String value) onComplete;
      final String productName;
      final int?approverID;

  @override
  State<LineCourseDialog> createState() => _LineCourseDialogState();
}

class _LineCourseDialogState extends State<LineCourseDialog> {
  final _lineCourseTextController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;

  @override
  void initState() {
    super.initState();
    _lineCourseTextController.text = widget.courseName;
    if (_scrollController.hasClients) _scrollController.jumpTo(50.0);
    initUpdateStatus();
  }

  initUpdateStatus() {
    final transactionCourseState =
        context.read<TransactionLineSetCourseCubit>();
    transactionCourseState.resetLoaderAndMessage();
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
          width:SizeConfig.getWidth(420),
          child: Stack(
            children: [
              Scrollbar(
                radius:  Radius.circular(SizeConfig.getSize(30)),
                controller: _scrollController,
                thickness: SizeConfig.getSize(10),
                thumbVisibility: true,
                interactive: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(SizeConfig.getSize(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              MessagesProvider.get('Set Course Name')
                                  .toUpperCase(),
                              style: _theme.heading2!.copyWith(fontSize:SizeConfig.getFontSize(26))
                            ),
                            // const SizedBox(height: 15),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: _theme.dialogFooterInnerShadow
                      ),
                       SizedBox(height: SizeConfig.getSize(1)),
                      Padding(
                        padding:  EdgeInsets.all(SizeConfig.getSize(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             SizedBox(height: SizeConfig.getSize(15)),
                            SizedBox(
                               height: SizeConfig.getSize(52),
                              child: TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(51),
                                ],
                                controller: _lineCourseTextController,
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
                            BlocBuilder<TransactionLineSetCourseCubit,
                                    TransactionLineSetCourseState>(
                                builder: (context, transactionCourseState) {
                               if (transactionCourseState.isError) {
                                return Padding(
                                  padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                  child: Text(
                                    transactionCourseState.statusMessage ?? '',
                                    style:  TextStyle(
                                      color: _theme.textField1Error!,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                );
                              }
                               return  SizedBox(height: SizeConfig.getSize(15),);
                            }),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: _theme.dialogFooterInnerShadow
                      ),
                       SizedBox(
                        height: SizeConfig.getSize(20),
                      ),
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
                              FocusScope.of(context).unfocus();
                              if (_validateTextField()) {
                                loader.showLoaderDialog(context,
                                    MessagesProvider.get("Updating Line Course..."));
                                final transactionLineCourseState =
                                    context.read<TransactionLineSetCourseCubit>();
                                await transactionLineCourseState
                                    .updateTransactionLineCourse(
                                    approverID:widget.approverID,
                                        lineCourseName:
                                            _lineCourseTextController.text,
                                        transactionLineIds:
                                            widget.transactionLineIds,
                                        lineRemarks: widget.lineRemarks ?? '');
                                if (transactionLineCourseState.state.isSuccess) {
                                  Future.microtask(() {
                                    loader.hideLoaderDialog(context);
                                    context
                                        .read<TransactionCubit>()
                                        .onTransactionDataUpdated(
                                        transactionLineCourseState.state
                                            .transactionResponse!.data);
                                    Navigator.pop(context);
                                  });
                                  widget.onComplete(
                                      MessagesProvider.get("Updated the course successfully for product &1.",["${widget.productName??''}"])
                                      );
                                } else {
                                  Future.microtask(() {
                                    loader.hideLoaderDialog(context);
                                  });
                                }
                              }
                            },
                          ),
                        ],
                      ),
                       SizedBox(
                        height: SizeConfig.getSize(20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateTextField(){
    if ((_lineCourseTextController.text.trim() != '') &&_lineCourseTextController.text.length > 50) {
      _showErrorDialog(MessagesProvider.get(
          "Line Course must be less than 50 characters."));
      return false;
    } else if ((_lineCourseTextController.text.trim() != '')&& !AppConstants
        .alphanumericRegExpWithSpecialChar
        .hasMatch(_lineCourseTextController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get(
          "Line Course should not contain any special characters"));
      return false;
    } else if ((_lineCourseTextController.text.trim() == '')&& _lineCourseTextController.text.isNotEmpty) {
      _showErrorDialog(MessagesProvider.get(
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
}
