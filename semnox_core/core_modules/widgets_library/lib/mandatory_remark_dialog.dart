import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';

import 'error_alert_dialog.dart';

class MandatoryRemarkDialog extends StatefulWidget {
  final int productId;
  final int quantity;
  final bool isCardProduct;
  final Function() onComplete;
  final Function() onCancel;
  final Function(String remarks) onRemarksInput;

  const MandatoryRemarkDialog(
      {Key? key,
      required this.productId,
      required this.quantity,
      required this.isCardProduct,
      required this.onComplete,
      required this.onCancel,
      required this.onRemarksInput})
      : super(key: key);

  @override
  State<MandatoryRemarkDialog> createState() => _MandatoryRemarkDialogState();
}

class _MandatoryRemarkDialogState extends State<MandatoryRemarkDialog> {
  final _remarkTextEditingController = TextEditingController();
  final _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late SemnoxTheme _theme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(15)),
      ),
      child: SizedBox(
        height: SizeConfig.getSize(250),
        width: SizeConfig.getSize(420),
        child: Padding(
          padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
          child: Scrollbar(
            radius:  Radius.circular(SizeConfig.getSize(10)),
            thumbVisibility: true,
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(SizeConfig.getSize(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          MessagesProvider.get("REMARKS"),
                          style: _theme.heading2!.copyWith(fontSize: SizeConfig.getFontSize(22)),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: _theme.dialogFooterInnerShadow,
                  ),
                   SizedBox(height: SizeConfig.getSize(1)),
                  Padding(
                    padding:  EdgeInsets.all(SizeConfig.getSize(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          MessagesProvider.get("* Remarks"),
                          style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                          textAlign: TextAlign.start,
                        ),
                         SizedBox(
                          height: SizeConfig.getSize(10),
                        ),
                        SizedBox(
                          height: SizeConfig.getSize(52),
                          child: TextFormField(
                            controller: _remarkTextEditingController,
                            style: _theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                            validator: (value) {
                              if (value == null || value.isEmpty || value.trim() == '') {
                                return MessagesProvider.get("Remarks is required");
                              } else if (value.isNotEmpty && value.length > 100) {
                                return MessagesProvider.get("Maximum characters are 100");
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(10), bottom: SizeConfig.getSize(10), right: SizeConfig.getSize(10), left: SizeConfig.getSize(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                  borderSide:  BorderSide(
                                    width: 1,
                                    color: _theme.secondaryColor!
                                  )),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(10)),
                                borderSide:  BorderSide(
                                  width: 1,
                                  color:_theme.secondaryColor!
                                ),
                              ), //MessagesProvider.get("Please enter required fields"),
                            ),
                          ),
                        ),
                         SizedBox(height: SizeConfig.getSize(15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: SizeConfig.getSize(68),
                              width: SizeConfig.getSize(138),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)), // <-- Radius
                                    ),
                                    backgroundColor: _theme.button1BG1,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    MessagesProvider.get("CANCEL"),
                                    style: _theme.heading4!.copyWith(fontSize: SizeConfig.getFontSize(20))
                                  ),
                                ),
                              ),
                            ),
                             SizedBox(width: SizeConfig.getSize(10)),
                            SizedBox(
                              height: SizeConfig.getSize(68),
                              width: SizeConfig.getSize(138),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: SizeConfig.getSize(4), vertical: SizeConfig.getSize(4)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)), // <-- Radius
                                  ),
                                  backgroundColor:  _theme.button2BG1,
                                ),
                                onPressed: () async {
                                  if(_validateTextField()){
                                    Navigator.pop(context);
                                    widget.onRemarksInput(_remarkTextEditingController.text);
                                  }
                                },
                                child: Text(
                                  MessagesProvider.get("OK"),
                                  style: _theme.headingLight5!.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _remarkTextEditingController.dispose();
  }

  bool _validateTextField(){
    if(_remarkTextEditingController.text.trim() == '')  {
      _showErrorDialog(MessagesProvider.get(
          "Remark is required"));
      return false;
    }
    else if ((_remarkTextEditingController.text.trim() != '') &&_remarkTextEditingController.text.length > 50) {
      _showErrorDialog(MessagesProvider.get(
          "A maximum of 50 characters is allowed for Remark"));
      return false;
    } else if ((_remarkTextEditingController.text.trim() != '')&& !RegExp(r'^[a-zA-Z0-9\s]+$').
        hasMatch(_remarkTextEditingController.text ?? '')) {
      _showErrorDialog(MessagesProvider.get(
          "Remark should not contain any special characters"));
      return false;
    } else if ((_remarkTextEditingController.text.trim() == '')&& _remarkTextEditingController.text.isNotEmpty) {
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
}
