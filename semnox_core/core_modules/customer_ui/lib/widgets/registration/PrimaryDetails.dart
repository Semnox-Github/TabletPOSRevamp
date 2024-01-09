import 'package:customer_ui/screens/registration/NewCustomerScreen.dart';
import 'package:customer_ui/widgets/CustomerDatePicker.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:customer_ui/widgets/IdProofProfileWidget.dart';
import 'package:customer_ui/widgets/IdProofWidget.dart';
import 'package:customer_ui/widgets/VerfiedCheckBox.dart';
import 'package:customer_ui/widgets/registration/TitleDropDown.dart';
import 'package:flutter/cupertino.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';

import '../../utils/AppColors.dart';
import '../../utils/size_config.dart';


class PrimaryDetails extends StatefulWidget{
  TextEditingController? firstNameCtr;
  TextEditingController? middleNameCtr;
  TextEditingController? lastNameCtr;
  TextEditingController dobNameCtr;
  TextEditingController? anniversaryCtr;
  TextEditingController? membershipCtr;
  TextEditingController? nickNameCtr;
  TextEditingController? uniqueIdentifierCtr;
  TextEditingController? companyCtr;
  TextEditingController? designationCtr;
  TextEditingController? taxCodeCtr;
  TextEditingController? notesCtr;
  TextEditingController? externalSystemReferenceCtr;
  TextEditingController? channelCtr;
  TextEditingController? userNameCtr;
  Function(dynamic)? onChange;
  VoidCallback? onImageClick;
  Function(dynamic)? onChangeGender;
  Function(dynamic)? onChangeType;
  Function(dynamic)? onChaneRightHanded;
  Function(dynamic)? onChangeTeamUser;
  String? image;
  String? titleView;
  String? firstNameView;
  String? idProofView;
  String? lastNameView;
  String? middleNameView;
  String? nickNameView;
  String? genderView;
  String? birthdateView;
  String? anniversaryView;
  String? uniqueIdView;
  String? rightHandView;
  String? teamUserView;
  String? companyView;
  String? designationView;
  String? taxCodeView;
  String? notesView ;
  String? extSysView ;
  String? channelView ;
  String? typeView ;
  String? usernameView ;
  bool? rightHanded = false;
  bool? teamUser = false;
  bool? verified = false;
  String? ignoreBirthYear;


  PrimaryDetails({
      this.firstNameCtr,
      this.middleNameCtr,
      this.lastNameCtr,
      required this.dobNameCtr,
      this.anniversaryCtr,
      this.membershipCtr,
      this.nickNameCtr,
      this.uniqueIdentifierCtr,
      this.companyCtr,
      this.designationCtr,
      this.taxCodeCtr,
      this.notesCtr,
      this.externalSystemReferenceCtr,
      this.channelCtr,
      this.userNameCtr,
      this.onChange,
      this.onImageClick,
      this.onChangeGender,
      this.onChangeType,
      this.onChangeTeamUser,
      this.onChaneRightHanded,
      this.image,
      this.titleView,
      this.firstNameView,
      this.idProofView,
      this.lastNameView,
      this.middleNameView,
      this.nickNameView,
      this.genderView,
      this.birthdateView,
      this.anniversaryView,
      this.uniqueIdView,
      this.rightHandView,
      this.teamUserView,
      this.companyView,
      this.designationView,
      this.taxCodeView,
      this.notesView,
      this.extSysView,
      this.channelView,
      this.typeView,
      this.usernameView,
      this.rightHanded,
      this.teamUser,
      this.verified,
      this.ignoreBirthYear});

  @override
  State<PrimaryDetails> createState() => _PrimaryDetailsState();
}

class _PrimaryDetailsState extends State<PrimaryDetails> {

  var _genders = <DropdownMenuItem<String>>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dropdownItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return   Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: theme.dialogFooterInnerShadow!,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleDropDown(
                                visible: (widget.titleView == 'M' || widget.titleView == 'O') ? true :false,
                                onChange: widget.onChange,validation : MessagesProvider.get("Select ") + MessagesProvider.get("Title"),),
                              const SizedBox(width: 8.0,),
                              Expanded(
                                child: CustomerFormWidget(
                                  title : MessagesProvider.get("* ")+MessagesProvider.get("First Name"), hint : MessagesProvider.get("Enter ") + MessagesProvider.get("First Name"), controller : widget.firstNameCtr,enable : true,
                                  validation : MessagesProvider.get("Enter ") + MessagesProvider.get("First Name"),maxLength: 50,),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomerFormWidget(
                                  visible: (widget.middleNameView == 'M' || widget.middleNameView == 'O') ? true :false,
                                  title : (widget.middleNameView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Middle Name"), hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Middle Name"), controller :widget.middleNameCtr,enable : true,
                                  validation : MessagesProvider.get("Enter ") + MessagesProvider.get("Middle Name"),  maxLength: 50,),
                              ),
                              const SizedBox(width: 8.0,),
                              Expanded(child:    CustomerFormWidget(title : (widget.lastNameView == 'M' ? MessagesProvider.get("*"):'')+ MessagesProvider.get("Last Name"),
                                hint :  MessagesProvider.get("Enter ") + MessagesProvider.get("Last Name"),
                                validation: (widget.lastNameView == 'M' ? MessagesProvider.get("Enter ") + MessagesProvider.get("Last Name"): null ),
                                controller :widget.lastNameCtr, enable : true,
                                maxLength: 50,),)
                            ],
                          ),
                          /*Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child:   CustomerDatePicker(MessagesProvider.get("Birth Date"),  MessagesProvider.get("dd-mm-yyyy"),dobNameCtr,true),
                              ),
                              const SizedBox(width: 8.0,),
                              Expanded(child:  CustomerFormWidget(
                                title: MessagesProvider.get("Membership"),hint : MessagesProvider.get("Membership"), controller : membershipCtr,enable : false,
                                maxLength: 50,),)
                            ],
                          )*/
                        ],
                      ),
                    ),
                    const SizedBox(width: 8.0,),
                    /*Align(
                      alignment: Alignment.bottomCenter,
                      child: VerifiedCheckBox(title : MessagesProvider.get("Verified"),enable : false,
                        onCheck: (value){
                          //_isChecked = value;
                        },),
                    ),*/
                   // const SizedBox(width: 8.0,),
                    /*Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IdProofWidget(MessagesProvider.get("Id Proof")),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IdProofWidget(
                      title: "Id Proof",
                      onPress: (){imageUploadedValue.value = '';
                      imageUploadedFileName.value = '';},
                  ),
                  // IdProofWidget(title : MessagesProvider.get("Id Proof"),
                  //   onPress: onImageClick,
                  //   image: image,
                  // ),
                ],
              ))
             ,
            ],
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: EdgeInsets.zero,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0.0,
            crossAxisCount: 3,
            childAspectRatio: 2.5,
            physics: ScrollPhysics(),
            children: [
              if (widget.nickNameView == 'M' || widget.nickNameView == 'O')
                CustomerFormWidget(
                    visible: (widget.nickNameView == 'M' || widget.nickNameView == 'O') ? true :false,
                    title : (widget.nickNameView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("NickName"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("NickName"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("NickName"),
                    controller: widget.nickNameCtr,enable : true),
              if (widget.genderView == 'M' || widget.genderView == 'O')
                Visibility(
                  visible: (widget.genderView == 'M' || widget.genderView == 'O') ? true:false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((widget.genderView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get('Gender'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : theme.heading6?.copyWith(color : Colors.grey, fontWeight: FontWeight.normal),),
                      const SizedBox(height: 4.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: DropdownButtonFormField<String>(
                          style: theme.heading5?.copyWith(
                              fontSize: 14.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500
                          ),
                          validator: (value){
                            if(widget.genderView != 'M'){
                              return null;
                            }else if (value == null || value.isEmpty) {
                              return MessagesProvider.get('Select ') + MessagesProvider.get('Gender');
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(SizeConfig.getSize(10), SizeConfig.getSize(8), 0, SizeConfig.getSize(10)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: _genders,
                          icon:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/down_arrow_white.png',height:SizeConfig.getSize(24),width:SizeConfig.getSize(24),color: AppColors.customerPageBackgroundColor,),
                          ),
                          hint:  Padding(
                            padding: const EdgeInsets.only(left:5),
                            child: Text(
                              /*_dropCtr.text ??*/ MessagesProvider.get('Select ') + MessagesProvider.get('Gender'),
                              style: TextStyle(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(18)),
                            ),
                          ),
                          onChanged: widget.onChangeGender,
                        ),
                      ),
                      const SizedBox(height: 10.0,)
                    ],
                  ),
                ),
              if (widget.birthdateView == 'M' || widget.birthdateView == 'O') ...[
                Visibility(
                    visible: (widget.birthdateView == 'M' || widget.birthdateView == 'O') ? true:false,
                    child: CustomerDatePicker( title : (widget.birthdateView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Birth Date"),
                        ignoreBirthYear: widget.ignoreBirthYear,
                        hint :  widget.ignoreBirthYear == "Y" ? MessagesProvider.get("dd-MM") : MessagesProvider.get("dd-mm-yyyy"),
                        validation: (widget.birthdateView == 'M' ? MessagesProvider.get("Enter ") + MessagesProvider.get("Birth Date"): null ),
                        controller : widget.dobNameCtr, isBrithDate : true)),
              ],
              if (widget.anniversaryView == 'M' || widget.anniversaryView == 'O') ...[
                Visibility(
                    visible: (widget.anniversaryView == 'M' || widget.anniversaryView == 'O') ? true:false,
                    child: CustomerDatePicker( title : (widget.anniversaryView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Anniversary"),
                        ignoreBirthYear: widget.ignoreBirthYear,
                        hint : widget.ignoreBirthYear == "Y" ? MessagesProvider.get("dd-MM") : MessagesProvider.get("dd-mm-yyyy"), controller : widget.anniversaryCtr,
                        validation: (widget.anniversaryView == 'M' ? MessagesProvider.get("Enter ") + MessagesProvider.get("Anniversary"): null ),
                        isBrithDate : true)),
              ],
              if (widget.uniqueIdView == 'M' || widget.uniqueIdView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.uniqueIdView == 'M' || widget.uniqueIdView == 'O') ? true:false,
                    title : (widget.uniqueIdView == 'M' ? MessagesProvider.get("* "):'')+MessagesProvider.get("Unique Identifier"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Unique Identifier"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Unique Identifier"),
                    controller: widget.uniqueIdentifierCtr,enable : true),
              ],
              if (widget.rightHandView == 'M' || widget.rightHandView == 'O') ...[

                Visibility(
                  visible: (widget.rightHandView == 'M' || widget.rightHandView == 'O') ? true:false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text((widget.rightHandView == 'M' ? MessagesProvider.get("*"):'') + MessagesProvider.get('Right Handed'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : theme.heading6?.copyWith(color : Colors.grey, fontWeight: FontWeight.normal),),
                      const SizedBox(height: 4.0,),
                      Padding(
                        padding: EdgeInsets.all(SizeConfig.getSize(15)),
                        child: SizedBox(
                          height:SizeConfig.getSize(24),
                          width:SizeConfig.getSize(24),
                          child: Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              checkColor: theme.secondaryColor,
                              activeColor: theme.backGroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                              ),
                              //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                              value: widget.rightHanded ,
                              onChanged:(bool? value) {
                                setState(() {
                                   widget.rightHanded = value!;
                                   widget.onChaneRightHanded!(widget.rightHanded);
                                });
                              } ,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              if (widget.teamUserView == 'M' || widget.teamUserView == 'O') ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text((widget.teamUserView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get('Team User'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : theme.heading6?.copyWith(color : Colors.grey, fontWeight: FontWeight.normal),),
                    const SizedBox(height: 0.0,),
                    Padding(
                      padding:  EdgeInsets.all(SizeConfig.getSize(15)),
                      child: SizedBox(
                        height:SizeConfig.getSize(24),
                        width:SizeConfig.getSize(24),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            checkColor: theme.secondaryColor,
                            activeColor: theme.backGroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                                  (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                            ),
                            //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                            value: widget.teamUser,
                            onChanged:(bool? value) {
                              setState(() {
                               widget.teamUser = value!;
                               widget.onChangeTeamUser!(widget.teamUser);
                            });
                            } ,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              if (widget.companyView == 'M' || widget.companyView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.companyView == 'M' || widget.companyView == 'O') ? true:false,
                    title : (widget.companyView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Company"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Company"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Company"),
                    controller: widget.companyCtr,enable : true),

              ],
              if (widget.designationView == 'M' || widget.designationView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.designationView == 'M' || widget.designationView == 'O') ? true:false,
                    title : (widget.designationView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Designation"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Designation"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Designation"),
                    controller: widget.designationCtr,enable : true),

              ],
              if (widget.taxCodeView == 'M' || widget.taxCodeView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.taxCodeView == 'M' || widget.taxCodeView == 'O') ? true:false,
                    title : (widget.taxCodeView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Tax Code"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Tax Code"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Tax Code"),
                    controller: widget.taxCodeCtr,enable : true),

              ],
              if (widget.notesView == 'M' || widget.notesView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.notesView == 'M' || widget.notesView == 'O') ? true:false,
                    title : (widget.notesView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Notes"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Notes"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Notes"),
                    controller: widget.notesCtr,enable : true),
              ],
              if (widget.extSysView == 'M' || widget.extSysView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.extSysView == 'M' || widget.extSysView == 'O') ? true:false,
                    title : (widget.extSysView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Ext. Sys. Ref."),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Ext. Sys. Ref."),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Ext. Sys. Ref."),
                    controller: widget.externalSystemReferenceCtr,enable : true),

              ],
              if (widget.channelView == 'M' || widget.channelView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.channelView == 'M' || widget.channelView == 'O') ? true:false,
                    title : (widget.channelView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Channel"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Channel"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Channel"),
                    controller: widget.channelCtr,enable : true),

              ],
              if (widget.typeView == 'M' || widget.typeView == 'O') ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text((widget.typeView == 'M' ? MessagesProvider.get("*"):'')+ MessagesProvider.get('Type'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : theme.heading6?.copyWith(color : Colors.grey, fontWeight: FontWeight.normal)),
                    const SizedBox(height: 4.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: DropdownButtonFormField<String>(
                        style: theme.heading5?.copyWith(
                            fontSize: SizeConfig.getSize(18),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                           EdgeInsets.fromLTRB(SizeConfig.getSize(10), SizeConfig.getSize(8), 0, SizeConfig.getSize(10)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        items: <String>[MessagesProvider.get('Registered'), MessagesProvider.get('UnRegistered')]
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                                padding:EdgeInsets.only(left:5),child: Text(value)),
                          );
                        }).toList(),
                        icon:   Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/down_arrow_white.png',height:SizeConfig.getSize(24),width:SizeConfig.getSize(24),color: AppColors.customerPageBackgroundColor,),
                        ),
                        hint:  Padding(
                          padding: EdgeInsets.only(left:5),
                          child: Text(
                            /*_dropCtr.text ??*/ MessagesProvider.get('Not set'),
                            style: TextStyle(color: theme.secondaryColor)?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                          ),
                        ),
                        onChanged: widget.onChangeType,
                      ),
                    ),
                    const SizedBox(height: 10.0,)
                  ],
                ),
              ],
              if (widget.usernameView == 'M' || widget.usernameView == 'O') ...[
                CustomerFormWidget(
                    visible: (widget.usernameView == 'M' || widget.usernameView == 'O') ? true:false,
                    title : (widget.usernameView == 'M' ? MessagesProvider.get("*"):'')+MessagesProvider.get("Username"),
                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Username"),
                    validation: MessagesProvider.get("Enter ") + MessagesProvider.get("Username"),
                    controller: widget.userNameCtr,enable : true),

              ],
              CustomerFormWidget(
                title: MessagesProvider.get("Membership"),hint : MessagesProvider.get("Membership"), controller : widget.membershipCtr,enable : false,
                maxLength: 50,),
              VerifiedCheckBox(title : MessagesProvider.get("Verified"),enable : false,
                onCheck: (value){
                  //_isChecked = value;
                },),
            ],
          ),
        ],
      ),
    );
  }

  void _dropdownItems(){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _genders = <DropdownMenuItem<String>>[
      DropdownMenuItem(
          value: "M",
          child: Text(" Male", style: theme.subtitle2)),
      DropdownMenuItem(
          value: "F",
          child: Text(" Female", style: theme.subtitle2)),
      DropdownMenuItem(
          value: "N",
          child: Text(" Not Set", style: theme.subtitle2))
    ];

    setState(() {

    });
  }
}
