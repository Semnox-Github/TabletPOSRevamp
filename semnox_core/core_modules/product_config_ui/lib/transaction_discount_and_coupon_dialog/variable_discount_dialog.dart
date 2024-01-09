import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/error_alert_dialog.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';


class VariableAmountDialog extends StatefulWidget {
  const VariableAmountDialog(
      {Key? key,
        required this.title,
        required this.enteredText,
      })
      : super(key: key);
  final String? title;
  final Function enteredText;

  @override
  State<VariableAmountDialog> createState() => _VariableAmountDialogState();
}

class _VariableAmountDialogState extends State<VariableAmountDialog> {
  final TextEditingController _variableAmountController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Dialog(
      child: SizedBox(
        height: SizeConfig.getSize(250),
        width: SizeConfig.getSize(420),
        child: Scrollbar(
          interactive: true,
          radius: const Radius.circular(10),
          thumbVisibility: true,
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.getSize(8), 0, SizeConfig.getSize(8), 0),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: SizeConfig.getHeight(10)),
                    Text(
                      widget.title?.toUpperCase() ?? '',
                      style: _theme.heading3!
                          .copyWith(fontSize: SizeConfig.getFontSize(20)),
                    ),
                    Divider(
                      thickness: 1,
                      color: _theme.dialogFooterInnerShadow!,
                    ),
                    SizedBox(height: SizeConfig.getHeight(10)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '*Enter ${widget.title ?? ''}',
                        style: _theme.subtitle1!
                            .copyWith(fontSize: SizeConfig.getFontSize(18)),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.getHeight(10),
                    ),
                    SizedBox(
                      height: SizeConfig.getHeight(42),
                      child: TextFormField(
                        controller: _variableAmountController,
                        style: _theme.title1!
                            .copyWith(fontSize: SizeConfig.getFontSize(16)),
                        readOnly: true,
                        onTap: (){
                          showDialog(
                              barrierDismissible: true,
                              context: context,
                              barrierColor: _theme.transparentColor,
                              builder: (BuildContext context) {
                                return NumberPad(
                                  title: '',
                                  isDecimalRequired: true,
                                  onOkPressed: (doubleValue) {
                                    setState(() {
                                      _variableAmountController.text = doubleValue.toString();
                                    });
                                  },
                                );
                              });
                        },
                        decoration: InputDecoration(
                            fillColor: _theme.primaryColor,
                            filled: true,
                            contentPadding: EdgeInsets.only(
                              top: 0,
                              bottom: 0,
                              right: SizeConfig.getSize(10),
                              left: SizeConfig.getSize(10),
                            ),
                            errorStyle:
                            TextStyle(color: _theme.textField1Error),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.getSize(8))),
                                borderSide: BorderSide(
                                    color: _theme.secondaryColor!)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.getSize(8))),
                                borderSide: BorderSide(
                                    color: _theme.secondaryColor!)),
                            hintText: MessagesProvider.get("Enter Amount"),
                            suffixStyle: _theme.textFieldHintStyle!.copyWith(
                                fontSize: SizeConfig.getFontSize(16))),
                      ),
                    ),
                    SizedBox(height: SizeConfig.getHeight(10)),
                    Divider(
                      thickness: 1,
                      color: _theme.dialogFooterInnerShadow!,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.getWidth(4),
                                      right: SizeConfig.getWidth(4)),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(SizeConfig.getWidth(100),
                                      SizeConfig.getHeight(42)),
                                  maximumSize: Size(SizeConfig.getWidth(100),
                                      SizeConfig.getHeight(42)),
                                  backgroundColor: _theme.button1BG1),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                    MessagesProvider.get('Cancel')
                                        .toUpperCase(),
                                    style: _theme.heading5!.copyWith(
                                        fontSize: SizeConfig.getFontSize(16))),
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.only(
                                      left: SizeConfig.getWidth(4),
                                      right: SizeConfig.getWidth(4)),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(SizeConfig.getWidth(100),
                                      SizeConfig.getHeight(42)),
                                  maximumSize: Size(SizeConfig.getWidth(100),
                                      SizeConfig.getHeight(42)),
                                  backgroundColor: _theme.button2BG1),
                              onPressed: ()  {
                                if(_variableAmountController.text.isEmpty){
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (BuildContext newContext) {
                                          return ErrorAlertDialog(title: 'Error',message:MessagesProvider.get("Enter Variable discount to proceed") ,
                                          );
                                        });

                                }
                                  else{
                                  widget.enteredText(
                                      _variableAmountController.text ??
                                          '');
                                }


                              },
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                  MessagesProvider.get('OK'),
                                  style: _theme.headingLight5!.copyWith(
                                      color: Colors.white,
                                      fontSize: SizeConfig.getFontSize(16)),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}