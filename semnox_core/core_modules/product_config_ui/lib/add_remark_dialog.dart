import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/utils/constants.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/utils/size_config.dart';

class AddRemarkDialog extends StatefulWidget {
  final String remarks;
  final int? approverID;
  final bool? transactionProfile;
  final Function(String value) onConfirm;

  const AddRemarkDialog(
      {Key? key, required this.remarks, required this.onConfirm, this.approverID, this.transactionProfile})
      : super(key: key);

  @override
  State<AddRemarkDialog> createState() => _AddRemarkDialogState();
}

class _AddRemarkDialogState extends State<AddRemarkDialog> {
  final _remarkTextController = TextEditingController();
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;

  @override
  void initState() {
    super.initState();
    _remarkTextController.text = widget.remarks;
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
                            MessagesProvider.get('Transaction Remarks').toUpperCase(),
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
                        SizedBox(height: SizeConfig.getSize(30)),
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
                              onPressed: () {
                                if (_validateTextField()) {
                                  FocusManager.instance.primaryFocus
                                      ?.unfocus();
                                  Navigator.pop(context);
                                  widget
                                      .onConfirm(_remarkTextController.text);
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
    if(_remarkTextController.text.trim() == '' && (widget.transactionProfile ?? false)) {
      _showErrorDialog(MessagesProvider.get( "Remark is required"));
      return false;
    }
    else if ((_remarkTextController.text.trim() != '') &&_remarkTextController.text.length > 50) {
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
    super.dispose();
    _remarkTextController.dispose();
  }
}

