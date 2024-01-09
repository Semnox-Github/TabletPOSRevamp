import 'package:customer_ui/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

import '../../utils/AppStyle.dart';

class NewContactWidget extends StatefulWidget{

  String title;
  String? hint;
  TextEditingController? controller;
  VoidCallback? onAdd;
  VoidCallback? onRemove;
  String? validationText;
  TextInputType? keyboardType;
  int? maxLength;
  var inputFormatter;
  String? phone1View;
  String? phone2View;
  String? countryCodeView;
  String? contactSubTypeView;
  String? emailView;
  bool isDefault;
  int contactType;
  String? countryCode;
  Function(dynamic) onChangeDefault;


  NewContactWidget({super.key,
    required this.title,
    this.hint,
    this.controller,
    this.onAdd,
    this.onRemove,
    this.validationText,
    this.keyboardType,
    this.maxLength,
    this.inputFormatter,
    this.phone1View,
    this.emailView,
    this.countryCodeView,
    this.phone2View,
    this.contactSubTypeView,
    required  this.isDefault,
    required this.contactType,
    this.countryCode,
    required this.onChangeDefault
  });


  @override
  State<NewContactWidget> createState() => _NewContactWidgetState();
}


class _NewContactWidgetState extends State<NewContactWidget> {

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: SizeConfig.getSize(300),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: theme.dialogFooterInnerShadow!,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                flex:2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),),
                    const SizedBox(height: 4.0,),
                   /* Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex:1,
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            value:  widget.isDefault,
                            checkColor: theme.secondaryColor,
                            activeColor: theme.backGroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                            ),
                            onChanged: (bool? value) {
                              setState(() {
                                widget.isDefault =value!;
                              });
                          },),
                        ),
                        const SizedBox(width: 5.0,),
                        Expanded(
                            flex: 2,
                            child: Text(MessagesProvider.get("Default"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor),),)
                      ],
                    ),*/
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(SizeConfig.getSize(10)),
                            child:SizedBox(
                          height:SizeConfig.getSize(24),
                          width:SizeConfig.getSize(24),

                          child: Transform.scale(
                            scale: 1.4,
                            child: Checkbox(
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                checkColor:theme.secondaryColor,
                                activeColor: theme.backGroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) =>  BorderSide(
                                      width: 1.0, color: theme.secondaryColor!),
                                ),
                                //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                                value: widget.isDefault,
                                onChanged: //widget.onChangeDefault
                              (bool? value) {
                                  print("onchanging value $value");
                                  setState(() {
                                    widget.isDefault = value!;
                                    widget.onChangeDefault(value);
                                  });
                                }
                            ),
                          ),
                        )),
                        Text(MessagesProvider.get("Default"),style:  theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(20)),overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    Visibility(
                      visible:(widget.contactSubTypeView == 'M' || widget.contactSubTypeView == 'O') ? true :false ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text((widget.contactSubTypeView == 'M' ?MessagesProvider.get(""):'')+MessagesProvider.get('Type'), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal),),
                          const SizedBox(height: 4.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: DropdownButtonFormField<String>(
                              style: theme.heading5?.copyWith(
                                  fontSize: SizeConfig.getFontSize(18),
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                 EdgeInsets.fromLTRB(SizeConfig.getSize(5), SizeConfig.getSize(5), 0, SizeConfig.getSize(5)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              items: <String>[MessagesProvider.get('Home'), MessagesProvider.get('Work')]
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                      padding:EdgeInsets.only(left:5),child: Text(value)),
                                );
                              }).toList(),
                              icon: Padding(padding:EdgeInsets.all(5),child: Image.asset('assets/down_arrow_white.png',height:SizeConfig.getSize(24),width:SizeConfig.getSize(24), color: theme.secondaryColor)),
                              hint:  Padding(
                                padding: EdgeInsets.only(left:5),
                                child: Text(
                                  MessagesProvider.get('Home'),
                                  style: TextStyle(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),
                                ),
                              ),
                              onChanged: (value) {
                                widget.contactType = value == MessagesProvider.get('Home') ? 1 :2;
                              },
                            ),
                          ),
                          const SizedBox(height: 8.0,)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(width: 8.0,),
              Container(color: theme.dividerColor,width: 1,height: SizeConfig.getSize(300)),//height: SizeConfig.getSize(300)
              const SizedBox(width: 8.0,),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(  (widget.countryCodeView == 'M' || widget.countryCodeView == 'O'))
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text((widget.countryCodeView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get('Country Code'), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) ),
                          const SizedBox(height: 4.0,),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: DropdownButtonFormField<String>(
                              style: theme.heading5?.copyWith(
                                  fontSize:  SizeConfig.getFontSize(20) ,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500
                              ),
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding:
                                 EdgeInsets.fromLTRB(SizeConfig.getSize(5), SizeConfig.getSize(10), 0, SizeConfig.getSize(10)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              items: <String>[MessagesProvider.get('+1')]
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                      padding:EdgeInsets.only(left:5),child: Text(value)),
                                );
                              }).toList(),
                              icon: Padding(padding:EdgeInsets.all(5),child: Image.asset('assets/down_arrow_white.png',height:SizeConfig.getSize(24),width:SizeConfig.getSize(24), color: theme.secondaryColor)),
                              hint:  Padding(
                                padding: EdgeInsets.only(left:5),
                                child: Text(
                                  MessagesProvider.get('+1'),
                                  style: TextStyle(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(20) ),
                                ),
                              ),
                              onChanged: (value) {
                                widget.countryCode = value;
                              },
                            ),
                          ),
                          const SizedBox(height: 10.0,)
                        ],
                      ),
                    const SizedBox(height: 4.0,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((widget.phone1View == 'M' ?MessagesProvider.get(""):'')+MessagesProvider.get(widget.title), style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) ),
                        const SizedBox(height: 4.0,),
                        TextFormField(
                          controller: widget.controller,
                          textAlign: TextAlign.start,
                          style:  theme.textFieldStyle?.copyWith(fontWeight: FontWeight.w500,fontSize: SizeConfig.getFontSize(18)),
                          keyboardType: widget.keyboardType,
                          maxLength: widget.maxLength,
                          inputFormatters: widget.inputFormatter != null ? [widget.inputFormatter] :[],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value){
                            if(widget.validationText == null){
                              return null;
                            }else if (value == null || value.isEmpty) {
                              return widget.validationText;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: widget.hint,
                            hintStyle: theme.textFieldHintStyle?.copyWith(color : Colors.grey,fontSize: SizeConfig.getFontSize(18)),
                            counterText: '',
                            counterStyle: const TextStyle(fontSize: 0),
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -14,
          right: 64,
          child: CircleAvatar(
            backgroundColor: theme.secondaryColor,
            radius: 15,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.add),
              color: theme.primaryColor,
              onPressed: widget.onAdd,
            ),
          ),
        ),
        Positioned(
          top: -14,
          right: 16,
          child: CircleAvatar(
            backgroundColor: theme.secondaryColor,
            radius: 15,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.remove),
              color: theme.primaryColor,
              onPressed: widget.onRemove,
            ),
          ),
        ),
      ],

    );
  }

}
