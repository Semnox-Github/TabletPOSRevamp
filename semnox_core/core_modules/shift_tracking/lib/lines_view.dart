import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/AppColors.dart';
import 'package:product_config_ui/widgets/primaryMediumButton.dart';
import 'package:shift_tracking/cashdrawer_assignment_dialog.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class LinesView extends StatefulWidget {
  const LinesView(
      {super.key,
      required this.type,
      required this.cashier,
      required this.system,
      required this.netShift,
      required this.buttonText,this.isSystemCDREnabled});

  final String type;
  final String? cashier;
  final String? system;
  final String? netShift;
  final String? buttonText;
  final bool? isSystemCDREnabled;

  @override
  State<StatefulWidget> createState() => _LinesViewState();
}

class _LinesViewState extends State<LinesView> {
  final TextEditingController _cashierEditingController = TextEditingController();
  FocusNode focus = FocusNode();
  late InputDecoration _textInputDecoration;

  @override
  void initState() {
    if(widget.cashier != null) {
      _cashierEditingController.text = widget.cashier!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;

    _textInputDecoration = InputDecoration(
      fillColor: theme.primaryColor,
      filled: true,
      hintText: MessagesProvider.get("Enter"),
      hintStyle: widget.isSystemCDREnabled == true ? TextStyle(
        color: theme.secondaryColor,fontWeight: FontWeight.w400
      ) : theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(19)),
      contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(5), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(5), left: SizeConfig.getSize(10)),
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
    );

    return Container(
        padding: EdgeInsets.all(SizeConfig.getWidth(5)),
        margin: EdgeInsets.only(bottom: SizeConfig.getWidth(7)),
        decoration: BoxDecoration(
            color: theme.tableRow1,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(4))),
        height: SizeConfig.getSize(55),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: Text(
                    MessagesProvider.get(widget.type),
                    style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: SizedBox(
                    height:SizeConfig.getSize(48),
                    child: TextFormField(
                      onTap: (){
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            barrierColor: const Color(0x01000000),
                            builder: (BuildContext context) {
                              return NumberPad(
                                initialOffset: Offset(50,50),
                                isZeroRequired: widget.type == '* Cash' || widget.type == '* Card Count' ? true : false,
                                title:'',
                                onOkPressed: (value) {
                                  if(widget.type == '* Cash'){
                                    cashCount.value = value.toString();
                                  }else if(widget.type == '* Card Count'){
                                    cardCount.value = value.toString();
                                  }else if(widget.type == 'Game Card'){
                                    gameCardCount.value = value.toString();
                                  }else if(widget.type == 'Credit Card'){
                                    creditCardCount.value = value.toString();
                                  }else if(widget.type == 'Others'){
                                    othersCount.value = value.toString();
                                  }else if(widget.type == 'Coupons'){
                                    couponsCount.value = value.toString();
                                  }else if(widget.type == 'Tickets'){
                                    ticketsCount.value = value.toString();
                                  }else{
                                    print(widget.type);
                                  }
                                  print(widget.type);
                                  setState(() {
                                    _cashierEditingController.text = value.toString();
                                    focus.unfocus();
                                  });
                                },
                              );
                            });
                      },
                      enabled: widget.isSystemCDREnabled == true ? true : false,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(15)
                        ],
                        focusNode: focus,
                        keyboardType: TextInputType.none,
                        controller: _cashierEditingController,
                        style: theme.subtitle2!.copyWith(fontSize: SizeConfig.getFontSize(19)),
                        decoration: _textInputDecoration
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: Text(
                    MessagesProvider.get(widget.system ?? "0"),
                    style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(5)),
                  child: Text(
                    MessagesProvider.get(widget.netShift ?? "0"),
                    style: theme.subtitle2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                  child: Visibility(
                    visible: widget.buttonText != null,
                    child: PrimaryMediumButton(
                      onPressed: () {},
                      text: MessagesProvider.get(widget.buttonText ?? ''),
                    ),
                  ),
              ),
            ],
          ),
        ));
  }
}
