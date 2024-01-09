import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/ContactDropdown.dart';
import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'dart:math' as math;

import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

class AddContactDialog extends StatefulWidget{

  TextEditingController contactController;
  TextEditingController? phone1Ctr ;
  TextEditingController? phone2Ctr ;
  TextEditingController? countryCodeCtr ;
  TextEditingController? phoneSubTypeCtr ;
  TextEditingController? attribute2 ;
  List<DropdownMenuItem>? item;
  dynamic value;
  Function(int? type)? onChange;
  VoidCallback? onPress;
  String title;
  bool? isChecked ;
  bool? isDefaultChecked ;
  int? type = 1;
  Function(bool? value)? onCheck;
  Function(bool? value)? onDefaultCheck;
  var formKey = GlobalKey<FormState>();
  String pressed = 'min';

  AddContactDialog({required this.title,required this.contactController,this.value,this.item,this.onChange,this.onPress,this.onCheck,
    this.isChecked,this.type,required this.formKey,this.countryCodeCtr,this.phoneSubTypeCtr,this.attribute2,this.isDefaultChecked,this.onDefaultCheck});

  @override
  State<AddContactDialog> createState() => _AddContactDialogState();
}

class _AddContactDialogState extends State<AddContactDialog> {
  String? _phone1View;
  String? _phone2View;
  String? _countryCodeView;
  String? _phoneSubTypeView;
  String? _emailView;
  String? _fbuserIdView;
  String? _fbAccessTokenView;
  String? _twAccessTokenView;
  String? _twsecretView;
  String? _weChatTokenView;
  final ScrollController _vertical = ScrollController();


  @override
  void initState() {
    super.initState();
    _isFieldEnabled();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return AlertDialog(
      title:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.title.toUpperCase(),style: theme.titleLight3?.copyWith(color : theme.secondaryColor),textAlign: TextAlign.start,),
          ),
          Container(height: 1,color: theme.dividerColor,),
        ],
      ),
      titlePadding:  const EdgeInsets.symmetric(horizontal: 0),
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: _widget(context),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomerDialogButton(text: MessagesProvider.get("Cancel").toUpperCase(),background: false, onPress: (){
          Navigator.pop(context);
        },),
        CustomerDialogButton(text: MessagesProvider.get("OK").toUpperCase(),onPress: widget.onPress,)
      ],
    );
  }

  _widget(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scroller(
      controller: _vertical,
      child: SingleChildScrollView(
        controller: _vertical,
        child: Form(
          key: widget.formKey,
          child: Container(
            padding: EdgeInsets.only(right: 20),
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.7,
            child: Column(
              children: [
                Visibility(
                    visible: widget.title.toUpperCase().startsWith("NEW") ? true : true,
                    child:GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(8),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      children:[
                        Column(
                          children: [
                            CheckboxListTile(
                              title: Text(MessagesProvider.get("IsActive"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor, fontSize:SizeConfig.getFontSize(18)),),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: widget.isChecked ?? true,
                              onChanged: (bool? value){
                                setState((){
                                  widget.isChecked = value ?? false;
                                  widget.onCheck!(widget.isChecked);
                                });
                              },
                              checkColor: theme.secondaryColor,
                              activeColor: theme.backGroundColor,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                              ),),
                          ],
                        ),

                        if(widget.title.toUpperCase().startsWith("NEW"))
                          Column(
                            children: [
                              Visibility(
                                visible: widget.title.toUpperCase().startsWith("NEW") ? true : false,
                                child: ContactDropDown(hint : MessagesProvider.get("Select ")+MessagesProvider.get("Contact Type"),
                                  item :[
                                    DropdownMenuItem(
                                        value: 1,
                                        child: Text(MessagesProvider.get("Email"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)))),
                                    DropdownMenuItem(
                                        value: 2,
                                        child: Text(MessagesProvider.get("Phone"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)))),
                                    DropdownMenuItem(
                                        value: 3,
                                        child: Text(MessagesProvider.get("Facebook"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)))),
                                    DropdownMenuItem(
                                        value: 4,
                                        child: Text(MessagesProvider.get("Twitter"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)))),
                                    DropdownMenuItem(
                                        value: 5,
                                        child: Text(MessagesProvider.get("Wechat"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor,fontSize:SizeConfig.getFontSize(18))))
                                  ],
                                  value: widget.value,
                                  onChange:(value){
                                    setState(() {
                                      widget.value  = value;
                                      widget.onChange!(value);
                                    });
                                  },),
                              ),
                              Visibility(
                                visible: widget.title.toUpperCase().startsWith("NEW") ? false : false,
                                child:  CustomerFormWidget(title : widget.value == 2 ? MessagesProvider.get("*") +MessagesProvider.get("Phone") : MessagesProvider.get("*") +MessagesProvider.get("Email"),
                                  hint : MessagesProvider.get("Enter ") +(widget.value == 2 ?  MessagesProvider.get("Phone") :  MessagesProvider.get("Email")),
                                  controller: widget.contactController,enable : true, validation : MessagesProvider.get("Enter ") + (widget.value == 2 ?  MessagesProvider.get("Phone") :  MessagesProvider.get("Email")),
                                  maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),
                              )
                            ],
                          ),

                        if(widget.value == 1 || widget.value == 2 )
                          Column(
                            children: [
                              CheckboxListTile(
                                title: Text(MessagesProvider.get("IsDefault"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)),),
                                controlAffinity: ListTileControlAffinity.leading,
                                value: widget.isDefaultChecked ?? true,
                                onChanged: (bool? value){
                                  setState((){
                                    widget.isDefaultChecked = value ?? false;
                                    widget.onDefaultCheck!(widget.isDefaultChecked);
                                  });
                                },
                                checkColor: theme.secondaryColor,
                                activeColor: theme.backGroundColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                                ),),
                            ],
                          ),

                        if(widget.value == 1 || widget.value == 2 && (_phoneSubTypeView == 'M' || _phoneSubTypeView == 'O'))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text((_phoneSubTypeView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get('Type'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20),) : AppStyle.customerDisableText,),
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
                                    const EdgeInsets.fromLTRB(2, 2, 0, 10),
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
                                  icon: Padding(padding:EdgeInsets.all(5),child: Image.asset('assets/down_arrow_white.png',height: 14,width: 18, color: theme.secondaryColor)),
                                  hint:  Padding(
                                    padding: EdgeInsets.only(left:5),
                                    child: Text(
                                      0 == 0 ? MessagesProvider.get('Home'):MessagesProvider.get('Work'),
                                      style: TextStyle(color: theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    //  _dropCtr.text = value!;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10.0,)
                            ],
                          ),

                        if( widget.value == 2 && (_countryCodeView == 'M' || _countryCodeView == 'O'))
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text((_countryCodeView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get('Country Code'), style: true ? theme.heading6?.copyWith( fontSize:SizeConfig.getFontSize(20)) : AppStyle.customerDisableText,),
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
                                    const EdgeInsets.fromLTRB(2, 2, 0, 10),
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
                                  icon: Padding(padding:EdgeInsets.all(5),child: Image.asset('assets/down_arrow_white.png',height: 14,width: 18, color: theme.secondaryColor)),
                                  hint:  Padding(
                                    padding: EdgeInsets.only(left:5),
                                    child: Text(
                                      MessagesProvider.get('+1'),
                                      style: TextStyle(color: theme.secondaryColor,fontSize:SizeConfig.getFontSize(18)),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    widget.countryCodeCtr?.text = value!;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10.0,)
                            ],
                          ),

                        if(widget.value == 2 && (_phone1View == 'M' || _phone1View == 'O' || _phone2View == 'M' || _phone2View == 'O'))
                          CustomerFormWidget(title :  (_phone1View == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Phone") ,
                            hint : MessagesProvider.get("Enter") +( MessagesProvider.get("Phone")),
                            controller: widget.contactController,enable : true,
                            validation :_phone1View == 'M' ?  MessagesProvider.get("Enter") + (MessagesProvider.get("Phone") ):null,
                            maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),

                        if(widget.value == 1 && (_emailView == 'M' || _emailView == 'O'))
                          CustomerFormWidget(title : (_emailView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Email"),
                            hint : MessagesProvider.get("Enter") +( MessagesProvider.get("Email")),
                            controller: widget.contactController,enable : true,
                            validation :_emailView == 'M' ?  MessagesProvider.get("Enter") + ( MessagesProvider.get("Email")):null,
                            maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),

                        if(widget.value == 3 && (_fbuserIdView == 'M' || _fbuserIdView == 'O'))
                          CustomerFormWidget(title : (_fbuserIdView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Facebook User Id"),
                            hint : MessagesProvider.get("Enter") +( MessagesProvider.get("Facebook User Id")),
                            controller: widget.contactController,enable : true,
                            validation :_fbuserIdView == 'M'? MessagesProvider.get("Enter") + ( MessagesProvider.get("Facebook User Id")) : null,
                            maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),

                        if(widget.value == 3 && (_fbAccessTokenView == 'M' || _fbAccessTokenView == 'O'))
                          CustomerFormWidget(title : (_fbAccessTokenView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Facebook Access Token"),
                            hint : MessagesProvider.get("Enter") +( MessagesProvider.get("Facebook Access Token")),
                            controller: widget.attribute2,enable : true,
                            validation : _fbAccessTokenView == 'M'?MessagesProvider.get("Enter") + ( MessagesProvider.get("Facebook Access Token")):null,
                            maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),

                        if(widget.value == 4 && (_twsecretView == 'M' || _twsecretView == 'O'))
                          CustomerFormWidget(title : (_twsecretView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Twitter Access Secret"),
                            hint : MessagesProvider.get("Enter") +( MessagesProvider.get("Twitter Access Secret")),
                            controller: widget.contactController,enable : true,
                            validation :_twsecretView == 'M'? MessagesProvider.get("Enter") + ( MessagesProvider.get("Twitter Access Secret")):null,
                            maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),

                        if(widget.value == 4 && (_twAccessTokenView == 'M' || _twAccessTokenView == 'O'))
                          CustomerFormWidget(title : (_twAccessTokenView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Twitter Access Token"),
                            hint : MessagesProvider.get("Enter") +( MessagesProvider.get("Twitter Access Token")),
                            controller: widget.attribute2,enable : true,
                            validation :_twAccessTokenView == 'M'? MessagesProvider.get("Enter") + ( MessagesProvider.get("Twitter Access Token")):null,
                            maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),

                        if(widget.value == 5 && (_weChatTokenView == 'M' || _weChatTokenView == 'O'))
                          CustomerFormWidget(title : (_weChatTokenView == 'M' ?MessagesProvider.get("*"):'')  +MessagesProvider.get("WeChat Access Token"),
                            hint : MessagesProvider.get("Enter") +( MessagesProvider.get("WeChat Access Token")),
                            controller: widget.contactController,enable : true,
                            validation :_weChatTokenView == 'M'? MessagesProvider.get("Enter") + ( MessagesProvider.get("WeChat Access Token")) :null,
                            maxLength: widget.value == 2 ? 13 : 1000, keyboardType: widget.value == 2 ? TextInputType.number : TextInputType.emailAddress,),

                      ],
                    )
                ),
                const Spacer(),
                Container(height: 1,color: theme.dividerColor,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _isFieldEnabled() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final contactPhoneResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CONTACT_PHONE');
    final countryCodeResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'COUNTRY_CODE');
    final phoneSubTypeResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'PHONE_SUBTYPE');
    final contact2Response = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CONTACT_PHONE2');
    final emailResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'EMAIL');
    final fbuseridResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'FBUSERID');
    final fbtokenResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'FBACCESSTOKEN');
    final twtokenResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TWACCESSTOKEN');
    final twsecretResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TWACCESSSECRET');
    final wechattokenResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'WECHAT_ACCESS_TOKEN');
    setState(() {
      _phone1View = contactPhoneResponse;
      _phone2View = contact2Response;
      _countryCodeView = countryCodeResponse;
      _phoneSubTypeView = phoneSubTypeResponse;
      _emailView = emailResponse;
      _fbuserIdView = fbuseridResponse;
      _fbAccessTokenView = fbtokenResponse;
      _twAccessTokenView = twtokenResponse;
      _twsecretView = twsecretResponse;
      _weChatTokenView = wechattokenResponse;
    });
  }

}
