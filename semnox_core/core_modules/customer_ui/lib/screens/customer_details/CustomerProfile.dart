import 'package:customer_data/builder.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/country_container/country_container_dto.dart';
import 'package:customer_data/models/country_container/state_container_dto.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/profile_dto.dart';
import 'package:customer_ui/AddAddreesDialog.dart';
import 'package:customer_ui/AddContactDialog.dart';
import 'package:customer_ui/VerifyCustomer.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/ContactTitleWidget.dart';
import 'package:customer_ui/widgets/CustomerDatePicker.dart';
import 'package:customer_ui/widgets/CustomerDetailTitle.dart';
import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:customer_ui/widgets/CustomerFormDropDown.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:customer_ui/widgets/CustomerNameCard.dart';
import 'package:customer_ui/widgets/IdProofProfileWidget.dart';
import 'package:customer_ui/widgets/VerfiedCheckBox.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:themes_library/themes_library.dart';

import '../../ListViewItems/AddressItem.dart';
import '../../ListViewItems/ContactItem.dart';
import 'package:logs_data/logger.dart';
import 'package:widgets_library/scroller.dart';
import 'package:notificationbar_ui/NotificationBar.dart';

class CustomerProfile extends StatefulWidget{
  final NotificationBar notificationBar;
  CustomerProfile({required this.notificationBar});

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  final ScrollController _customerDetailController = ScrollController();
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _dobNameCtr = TextEditingController();
  final _membershipCtr = TextEditingController();
  final _contactCtr = TextEditingController();
  final _addressCtr = TextEditingController();
  final _verificationCtr = TextEditingController();
  int _contactType = 2;
  final _formKey = GlobalKey<FormState>();
  final _contactFormKey = GlobalKey<FormState>();
  final _addressFormKey = GlobalKey<FormState>();
  final _verifyFormKey = GlobalKey<FormState>();
  bool _isLoading = false;
  int _contactSelectedIndex = 0;
  int _addressSelectedIndex = 0;
  List<AddressDTO>? _addressList;
  List<ContactDTO>? _contactList;
  bool _primaryDetailsView = true;
  bool _contactView = true;
  bool _addressView = true;
  CustomerData? data;
  bool _contactIsActive = true;
  bool _addressIsActive = true;
  bool _isAgreed = false;
  final _titleCtr = TextEditingController();
  final _addressTypeCtr = TextEditingController();
  final _addressLine1Ctr = TextEditingController();
  final _addressLine2Ctr = TextEditingController();
  final _addressLine3Ctr = TextEditingController();
  final _addressCityCtr = TextEditingController();
  final _addressStateCtr = TextEditingController();
  final _addressCountryCtr = TextEditingController();
  final _nickNameCtr = TextEditingController();
  final _genderCtr = TextEditingController();
  final _birthdateCtr = TextEditingController();
  final _anniversaryCtr = TextEditingController();
  final _uniqueIdCtr = TextEditingController();
  bool _isRightHand = false;
  bool _isTeamUser = false;
  bool _isChecked = false;
  final _companyCtr = TextEditingController();
  final _designationCtr = TextEditingController();
  final _taxCodeCtr = TextEditingController();
  final _notesCtr = TextEditingController();
  final _extSysCtr = TextEditingController();
  final _channelCtr = TextEditingController();
  final _countryCodeCtr  = TextEditingController();
  final _phoneSubTypeCtr  = TextEditingController();
  final _attribute2Ctr  = TextEditingController();
  int _type =0;
  final _usernameCtr = TextEditingController();
  String showTermsAndConditions = 'N';
  var _execContextBL;
  var _execContext;
  var _masterDataBl;

  CountryContainerDTO? _country;
  StateContainerDTO? _state;
  final _idProofFileURL = TextEditingController();
  String? _titleView;
  String? _firstNameView;
  String? _idProofView;
  String? _lastNameView;
  String? _middleNameView;
  String? _nickNameView;
  String? _genderView;
  String? _birthdateView;
  String? _anniversaryView;
  String? _uniqueIdView;
  String? _rightHandView;
  String? _teamUserView;
  String? _companyView;
  String? _designationView;
  String? _taxCodeView;
  String? _notesView ;
  String? _extSysView ;
  String? _channelView ;
  String? _typeView ;
  String? _usernameView ;
  bool initiated = false;
  String? _ignoreBirthYear;


  @override
  void initState() {
    super.initState();
    _isFieldEnabled();
    initializeDateFormatting();
    Future.microtask(() => _initDropDownList());
    _initFunctions();
  }

  _initFunctions() async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    showTermsAndConditions = await _masterDataBl.getDefaultValuesByName(defaultValueName: "TERMS_AND_CONDITIONS");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(!initiated) {
      _membershipCtr.text = context
          .watch<SelectedCardDetails>()
          .selectedData
          ?.membershipName
          .toString() ?? '-';
      data = context
          .watch<SelectedCustomer>()
          .selectedData;
      if (data != null) {
        var birthDate = data?.dateOfBirth ?? '';
        var anniversary = data?.anniversary ?? '';
        if (birthDate != '') {
          DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
          DateTime tempDate = dateFormat.parse(birthDate);
          String dob = _ignoreBirthYear == "Y"?   DateFormat("dd-MM").format(tempDate) : DateFormat("dd-MM-yyyy").format(tempDate);
          _dobNameCtr.text = dob.toString() ?? "";
        }
        if (anniversary != '') {
          DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
          DateTime tempDate = dateFormat.parse(anniversary);
          String dob = _ignoreBirthYear == "Y"?   DateFormat("dd-MM").format(tempDate) : DateFormat("dd-MM-yyyy").format(tempDate);
          _anniversaryCtr.text = dob.toString() ?? "";
        }
        _addressList = data?.addressDTOList?.toList() ?? [];
        _contactList = data?.contactDTOList?.toList() ?? [];
      }
      _firstNameCtr.text = data?.firstName ?? "";
      _middleNameCtr.text = data?.middleName ?? "";
      _lastNameCtr.text = data?.lastName ?? "";
      _titleCtr.text = data?.title ?? 'Mr';
      _idProofFileURL.text = data?.idProofFileURL ?? '';
      _nickNameCtr.text = data?.nickName ?? '';
      _genderCtr.text = data?.gender ?? '';
      _birthdateCtr.text = data?.dateOfBirth ?? '';
      _uniqueIdCtr.text = data?.uniqueIdentifier ?? '';
      _isRightHand = data?.rightHanded ?? false;
      _isTeamUser = data?.teamUser ?? false;
      _companyCtr.text = data?.company ?? '';
      _designationCtr.text = data?.designation ?? '';
      _taxCodeCtr.text = data?.taxCode ?? '';
      _notesCtr.text = data?.notes ?? '';
      _extSysCtr.text = data?.externalSystemReference ?? '';
      _channelCtr.text = data?.channel ?? '';
      _type = data?.customerType ?? 0;
      _usernameCtr.text = data?.userName ?? '';
      _isChecked = data?.verified ?? false;
      initiated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backGroundColor,
      body: Container(
        color: theme.backGroundColor,
        child: Scroller(
          controller:_customerDetailController,
          child: Padding(
            padding: const EdgeInsets.only(right: 26.0),
            child: SingleChildScrollView(
              controller: _customerDetailController,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomerNameCard(
                      name: "${_firstNameCtr.text}  ${_lastNameCtr.text}",
                      membership:
                      _membershipCtr.text.isNotEmpty ? _membershipCtr.text : '-',
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: theme.dividerColor!,width: 1,),borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            CustomerDetailTitle(title: MessagesProvider.get("Primary Details"),buttonText: MessagesProvider.get("Save").toUpperCase(),
                              active: false,
                              icon: _primaryDetailsView ? Image.asset("assets/ic_up_arrow.png" , color : theme.secondaryColor) : Image.asset("assets/ic_down.png", color : theme.secondaryColor),
                              onPress: (){
                                if (_formKey.currentState!.validate()) {
                                  _save();
                                }
                                else{
                                  if((_titleView == 'M') && (_titleCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Title is mandatory.Please enter a value.'));
                                  }
                                  else  if((_firstNameView == 'M') && (_firstNameCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('First Name is mandatory.Please enter a value.'));
                                  }
                                  else  if((_middleNameView == 'M') && (_middleNameCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Middle Name is mandatory.Please enter a value.'));
                                  }
                                  else  if((_lastNameView == 'M') && (_lastNameCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Last Name is mandatory.Please enter a value.'));
                                  }
                                  else  if((_nickNameView == 'M') && (_nickNameCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Nick Name is mandatory.Please enter a value.'));
                                  }
                                  else  if((_genderView == 'M') && (_genderCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Gender is mandatory.Please enter a value.'));
                                  }
                                  else  if((_anniversaryView == 'M') && (_anniversaryCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Anniversary is mandatory.Please enter a value.'));
                                  }
                                  else  if((_uniqueIdView == 'M') && (_uniqueIdCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Unique Identifier is mandatory.Please enter a value.'));
                                  }
                                  else  if((_companyView == 'M') && (_companyCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Company is mandatory.Please enter a value.'));
                                  }
                                  else  if((_designationView == 'M') && (_designationCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Designation is mandatory.Please enter a value.'));
                                  }
                                  else  if((_taxCodeView == 'M') && (_taxCodeCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Tax Code is mandatory.Please enter a value.'));
                                  }
                                  else  if((_notesView == 'M') && (_notesCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Notes is mandatory.Please enter a value.'));
                                  }
                                  else  if((_extSysView == 'M') && (_extSysCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Ext. Sys. Ref. is mandatory.Please enter a value.'));
                                  }
                                  else  if((_channelView == 'M') && (_channelCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Channel is mandatory.Please enter a value.'));
                                  }
                                  else  if((_usernameView == 'M') && (_usernameCtr.text.isEmpty)){
                                    _showNotification(MessagesProvider.get('Username is mandatory.Please enter a value.'));
                                  }
                                }
                              },
                              onPressIcon: (){
                                setState(() {
                                  _primaryDetailsView = !_primaryDetailsView;
                                });
                              },),
                            Visibility(
                              visible: _primaryDetailsView,
                              child: Divider(
                                color: theme.dividerColor,
                                height: 1,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
                            Visibility(
                              visible: _primaryDetailsView,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Visibility(
                                                visible: (_titleView == 'M' || _titleView == 'O') ? true:false,
                                                child: CustomerFormDropDown(title : (_titleView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("Title"),
                                                  hint : MessagesProvider.get("Select ") + MessagesProvider.get("Title"),
                                                  validation:_titleView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("Title"):null,
                                                  controller: _titleCtr,enable : true,),
                                              ),
                                              Visibility(
                                                visible: (_middleNameView == 'M' || _middleNameView == 'O') ? true:false,
                                                child: CustomerFormWidget(title : (_titleView == 'M' ?MessagesProvider.get("*"):'') + MessagesProvider.get("Middle Name"),
                                                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Middle Name"),
                                                    validation:_middleNameView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("Middle Name"):null,
                                                    controller : _middleNameCtr,enable : true),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CustomerFormWidget(title : (MessagesProvider.get("*"))+MessagesProvider.get("First Name"),
                                                hint : MessagesProvider.get("Enter ") + MessagesProvider.get("First Name"),
                                                validation:_firstNameView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("First Name"):null,
                                                controller: _firstNameCtr,enable : true),
                                            Visibility(
                                              visible: (_lastNameView == 'M' || _lastNameView == 'O') ? true:false,
                                              child: CustomerFormWidget(title : (_lastNameView == 'M' ?MessagesProvider.get("*"):'') + MessagesProvider.get("Last Name"),
                                                  validation:_lastNameView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("Last Name"):null,
                                                  hint :MessagesProvider.get("Enter ") + MessagesProvider.get("Last Name"), controller : _lastNameCtr,
                                                  enable : true),
                                            ),

                                          ],
                                        ),
                                      )),
                                      Expanded(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Visibility(
                                                visible: (_idProofView == 'M' || _idProofView == 'O') ? true:true,
                                                child: IdProofProfileWidget(title: (_idProofView == 'M' ?MessagesProvider.get("*"):'*') + MessagesProvider.get("Id Proof"),idProofFileURL: _idProofFileURL,)
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                  GridView.count(
                                    shrinkWrap: true,
                                    primary: false,
                                    padding: const EdgeInsets.all(8),
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 0,
                                    crossAxisCount: 3,
                                    childAspectRatio: 2.3,
                                    children:[
                                      if(_nickNameView == 'M' || _nickNameView == 'O')
                                        CustomerFormWidget(title : (_nickNameView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("NickName"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("NickName"),
                                            validation:_nickNameView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("NickName"):null,
                                            controller: _nickNameCtr,enable : true),

                                      if(_genderView == 'M' || _genderView == 'O')
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text((_genderView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get('Gender'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : AppStyle.customerDisableText,),
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
                                                  EdgeInsets.fromLTRB(2, SizeConfig.getSize(5), 0, SizeConfig.getSize(10)),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                  ),
                                                ),
                                                validator: (value){
                                                  if(value == MessagesProvider.get('Not set')){
                                                    MessagesProvider.get('Select Gender');
                                                  }
                                                },
                                                items: <String>[MessagesProvider.get('Male'), MessagesProvider.get('Female'), MessagesProvider.get('Not set')]
                                                    .map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Padding(
                                                        padding:EdgeInsets.only(left:5),child: Text(value)),
                                                  );
                                                }).toList(),
                                                icon:  Icon(
                                                  Icons.arrow_drop_down,
                                                  color: theme.secondaryColor,
                                                ),
                                                hint:  Padding(
                                                  padding: EdgeInsets.only(left:5),
                                                  child: Text(
                                                    _genderCtr.text == 'N'?MessagesProvider.get('Not set'):_genderCtr.text == 'M' ? MessagesProvider.get('Male'):MessagesProvider.get('Female'),
                                                    style: TextStyle(color: theme.secondaryColor)?.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                  ),
                                                ),
                                                onChanged: (value) {
                                                  value == MessagesProvider.get('Not set') ? _genderCtr.text = 'N' :  value == MessagesProvider.get('Male')? _genderCtr.text = 'M': _genderCtr.text = 'F';
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 10.0,)
                                          ],
                                        ),

                                      if(_birthdateView == 'M' || _birthdateView == 'O')
                                        CustomerDatePicker(title : (_birthdateView == 'M' ?MessagesProvider.get("*"):'') + MessagesProvider.get("Birth Date"),
                                            validation:_birthdateView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("Birth Date"):null,
                                            hint : MessagesProvider.get("dd_mm_yyyy"),
                                            ignoreBirthYear: _ignoreBirthYear,
                                           controller:  _dobNameCtr,isBrithDate : true),

                                      if(_anniversaryView == 'M' || _anniversaryView == 'O')
                                        CustomerDatePicker(title : (_anniversaryView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Anniversary"),
                                            validation:_anniversaryView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("Anniversary"):null,
                                            ignoreBirthYear: _ignoreBirthYear,
                                            hint : MessagesProvider.get("dd_mm_yyyy"),controller:  _anniversaryCtr,isBrithDate: true),

                                      if(_uniqueIdView == 'M' || _uniqueIdView == 'O')
                                        CustomerFormWidget(title : (_uniqueIdView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Unique Identifier"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Unique Identifier"),
                                            validation:_uniqueIdView == 'M'? MessagesProvider.get("Enter ") + MessagesProvider.get("Unique Identifier"):null,
                                            controller: _uniqueIdCtr,enable : true),

                                      if(_rightHandView == 'M' || _rightHandView == 'O')
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text((_rightHandView == 'M' ?MessagesProvider.get("*"):'') + MessagesProvider.get('Right Handed'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : theme.heading6?.copyWith(color : Colors.grey, fontWeight: FontWeight.normal),),
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
                                                    value:_isRightHand,
                                                    onChanged:(bool? value) {
                                                      setState(() {
                                                        _isRightHand = value!;
                                                      });
                                                    } ,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      if(_teamUserView == 'M' || _teamUserView == 'O')
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text((_teamUserView == 'M' ? MessagesProvider.get("*"):'') +MessagesProvider.get('Team User'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : theme.heading6?.copyWith(color : Colors.grey, fontWeight: FontWeight.normal),),
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
                                                    value:_isTeamUser,
                                                    onChanged:(bool? value) {
                                                      setState(() {
                                                        _isTeamUser = value!;
                                                      });
                                                    } ,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      if(_companyView == 'M' || _companyView == 'O')
                                        CustomerFormWidget(title : (_companyView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("Company"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Company"),
                                            validation: _companyView == 'M' ? MessagesProvider.get("Enter ") + MessagesProvider.get("Company"):null,
                                            controller: _companyCtr,enable : true),

                                      if(_designationView == 'M' || _designationView == 'O')
                                        CustomerFormWidget(title : (_designationView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("Designation"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Designation"),
                                            validation: _designationView == 'M' ? MessagesProvider.get("Enter ") + MessagesProvider.get("Designation"):null,
                                            controller: _designationCtr,enable : true),

                                      if(_taxCodeView == 'M' || _taxCodeView == 'O')
                                        CustomerFormWidget(title : (_taxCodeView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("Tax Code"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Tax Code"),
                                            validation:_taxCodeView == 'M' ?  MessagesProvider.get("Enter ") + MessagesProvider.get("Tax Code"):null,
                                            controller: _taxCodeCtr,enable : true),

                                      if(_notesView == 'M' || _notesView == 'O')
                                        CustomerFormWidget(title : (_notesView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("Notes"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Notes"),
                                            validation:_notesView == 'M' ?  MessagesProvider.get("Enter ") + MessagesProvider.get("Notes"):null,
                                            controller: _notesCtr,enable : true),

                                      if(_extSysView == 'M' || _extSysView == 'O')
                                        CustomerFormWidget(title : (_extSysView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("Ext. Sys. Ref."),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Ext. Sys. Ref."),
                                            validation:_extSysView == 'M' ?  MessagesProvider.get("Enter ") + MessagesProvider.get("Ext. Sys. Ref."):null,
                                            controller: _extSysCtr,enable : true),

                                      if(_channelView == 'M' || _channelView == 'O')
                                        CustomerFormWidget(title : (_channelView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("Channel"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Channel"),
                                            validation:_channelView == 'M' ?  MessagesProvider.get("Enter ") + MessagesProvider.get("Channel"):null,
                                            controller: _channelCtr,enable : true),

                                      if(_typeView == 'M' || _typeView == 'O')
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text((_typeView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get('Type'), style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal)  : AppStyle.customerDisableText,),
                                            const SizedBox(height: 4.0,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 0),
                                              child: DropdownButtonFormField<String>(
                                                style: theme.heading5?.copyWith(
                                                    fontSize:  SizeConfig.getFontSize(18),
                                                    fontStyle: FontStyle.normal,
                                                    fontWeight: FontWeight.w500
                                                ),
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                   EdgeInsets.fromLTRB(2, SizeConfig.getSize(5), 0, SizeConfig.getSize(10)),
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
                                                icon:  Icon(
                                                  Icons.arrow_drop_down,
                                                  color: theme.secondaryColor,
                                                ),
                                                hint:  Padding(
                                                  padding: EdgeInsets.only(left:5),
                                                  child: Text(
                                                    _type == 0 ? MessagesProvider.get('Registered'):MessagesProvider.get('UnRegistered'),
                                                    style: TextStyle(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),
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

                                      if(_usernameView == 'M' || _usernameView == 'O')
                                        CustomerFormWidget(title : (_usernameView == 'M' ?MessagesProvider.get("*"):'')+MessagesProvider.get("username"),
                                            hint : MessagesProvider.get("Enter ") + MessagesProvider.get("username"),
                                            validation:_usernameView == 'M' ?  MessagesProvider.get("Enter ") + MessagesProvider.get("username"):null,
                                            controller: _usernameCtr,enable : true),

                                      CustomerFormWidget(title : MessagesProvider.get("Membership"),hint :MessagesProvider.get("Membership"),
                                          controller : _membershipCtr,
                                          enable : false),

                                      VerifiedCheckBox(title : MessagesProvider.get("Verified"), enable : data?.verified ?? true,
                                        onCheck: (value){
                                          _isChecked = value!;
                                        },),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: theme.dividerColor!,width: 1,),borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            CustomerDetailTitle(title: MessagesProvider.get("Contact"),
                              buttonText: MessagesProvider.get("Add").toUpperCase(),
                              icon: _contactView ? Image.asset("assets/ic_up_arrow.png", color : theme.secondaryColor) : Image.asset("assets/ic_down.png", color : theme.secondaryColor),
                              onCheck: (value){
                                setState((){
                                  _contactIsActive = value!;
                                });
                              },
                              onPress: (){
                                _showContactDialog(MessagesProvider.get("New Contact"),null,-1,true);
                              },
                              onPressIcon: (){
                                setState(() {
                                  _contactView = !_contactView;
                                });
                              },),
                            Visibility(
                              visible: _contactView,
                              child: Divider(
                                color: theme.dividerColor,
                                height: 1,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
                            Visibility(
                                visible: _contactView,
                                child: ContactTitleWidget(MessagesProvider.get("Contact"))),
                            Visibility(
                              visible: _contactView,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  itemCount: _contactList?.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return  ContactItem(selectedIndex : _contactSelectedIndex,index : index, contactDTO:  _contactList?[index],
                                      isChecked : _contactList?[index].isActive ?? true,
                                      isActive: _contactIsActive,
                                      onChange: (value){
                                        setState(() {
                                          _contactSelectedIndex = value;
                                        });
                                      },
                                      onPress: (){
                                        _showContactDialog(MessagesProvider.get("Edit Contact"),_contactList?[index],index,false);
                                      },
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: theme.dividerColor!,width: 1,),borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: [
                            CustomerDetailTitle(title: MessagesProvider.get("Address"),buttonText: MessagesProvider.get("Add").toUpperCase(),
                              icon: _addressView ? Image.asset("assets/ic_up_arrow.png", color : theme.secondaryColor) : Image.asset("assets/ic_down.png", color : theme.secondaryColor),
                              onCheck: (value){
                                setState((){
                                  _addressIsActive = value!;
                                });
                              },
                              onPress: (){
                                _showAddressDialog(MessagesProvider.get("New Address"),null,-1,true);
                              },onPressIcon: (){
                                setState(() {
                                  _addressView = !_addressView;
                                });
                              },),
                            Visibility(
                              visible: _addressView,
                              child: Divider(
                                color: theme.dividerColor,
                                height: 1,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                            ),
                            Visibility(
                                visible: _addressView,
                                child: ContactTitleWidget(MessagesProvider.get("Address"))),
                            Visibility(
                              visible: _addressView,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: _addressList?.length,
                                  physics: const ScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) {
                                    return  AddressItem(selectedIndex : _addressSelectedIndex,index:  index,addressDTO: _addressList?[index],
                                      isActive: _addressIsActive,
                                      isChecked : _addressList?[index].isActive ?? true,
                                      onChange: (value){
                                        setState(() {
                                          _addressSelectedIndex = value;
                                        });
                                      },
                                      onPress: (){
                                        _showAddressDialog(MessagesProvider.get("Edit Address"),_addressList?[index],index,false);
                                      },);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            showTermsAndConditions== 'Y'? Row(
              children: [
                Checkbox(
                  checkColor: theme.secondaryColor,
                  activeColor: theme.backGroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                  ),
                  //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                  value: _isAgreed,
                  onChanged:(bool? value) {
                    setState(() {
                      _isAgreed = value!;
                    });
                  } ,
                ),
                Text(MessagesProvider.get("Click here to agree to Terms and Conditions"),style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),overflow: TextOverflow.ellipsis,),
              ],
            ): Container(),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomerDialogButton(text: MessagesProvider.get("Verify").toUpperCase(),onPress: (){
                showDialog(context: context,
                    barrierDismissible: false,
                    builder: (_) => VerifyCustomer(formKey: _verifyFormKey, controller: _verificationCtr,
                      onSend: (){
                        if (_verifyFormKey.currentState!.validate()) {

                        }
                      },
                      onConfirm: (){
                        if (_verifyFormKey.currentState!.validate()) {

                        }
                      },));
              },),
            )
          ],
        )
      ],
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  void _save() async{
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);

    String dob = "";
    String anniversary = "";
    if(_dobNameCtr.text != "") {
      String dd = _ignoreBirthYear == "Y"? _dobNameCtr.text+"-1904" : _dobNameCtr.text;
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime tempDate = dateFormat.parse(dd);
      dob = DateFormat("yyyy-MM-ddTHH:mm:ss").format(tempDate);
    }
    if(_anniversaryCtr.text != "") {
      String dd = _ignoreBirthYear == "Y"? _anniversaryCtr.text+"-2023" : _anniversaryCtr.text;
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      DateTime tempDate = dateFormat.parse(dd);
      anniversary = DateFormat("yyyy-MM-ddTHH:mm:ss").format(tempDate);
    }

    ProfileDTO profileDTO = ProfileDTO(id: data?.profileDTO?.id ?? -1, profileTypeId: data?.profileDTO?.profileTypeId ?? -1, profileType: data?.profileDTO?.profileType ?? -1, title: _titleCtr.text ?? "",
        firstName: _firstNameCtr.text, nickName: _nickNameCtr.text ?? "", middleName: _middleNameCtr.text, lastName: _lastNameCtr.text,
        dateOfBirth: dob,
        notes: _notesCtr.text ?? '', gender: _genderCtr.text ?? 'N', photoURL: data?.photoURL ?? '', rightHanded: _isRightHand ?? false, teamUser: _isTeamUser ??  false,
        uniqueIdentifier: _uniqueIdCtr.text ?? '', idProofFileURL: _idProofFileURL.text ?? '',
        taxCode: _taxCodeCtr.text ?? '', designation: _designationCtr.text ?? '', company: _companyCtr.text ?? '', userName:  _usernameCtr.text ?? '',
        password: data?.password ?? '', contactDTOList: _contactList, addressDTOList : _addressList,profileContentHistoryDTOList: data?.profileDTO?.profileContentHistoryDTOList ?? null,
        optInPromotions: data?.profileDTO?.optInPromotions ?? false,
        optInPromotionsMode: data?.profileDTO?.optInPromotionsMode ?? '', policyTermsAccepted: data?.profileDTO?.policyTermsAccepted ?? false,
        isActive: data?.isActive ??  true, createdBy: data?.createdBy ?? '', creationDate: data?.creationDate ?? '',
        lastUpdatedBy: data?.lastUpdatedBy ?? '', lastUpdateDate: data?.lastUpdateDate ?? '',
        siteId: data?.siteId ?? -1, masterEntityId: data?.masterEntityId ?? -1, synchStatus: data?.synchStatus ??  false,
        guid: data?.guid ?? '', externalSystemReference: _extSysCtr.text ?? '', optOutWhatsApp:  false,channel: _channelCtr.text ?? '',
        userStatus: data?.profileDTO?.userStatus ?? '',anniversary: anniversary,
        invalidAccessAttempts:  data?.profileDTO?.invalidAccessAttempts ??  0,
        passwordChangeOnNextLogin: data?.profileDTO?.passwordChangeOnNextLogin ?? false,
        isChanged: true,isChangedRecursive: data?.isChangedRecursive ?? false);

    try{
      var response = await customerSearchBL.updateCustomerProfile(
          customerId: data?.id ?? -1,
          profileDTO: profileDTO
      );

      if(response.exception == null) {
        _setLoadingStatus(false);
        context.read<SelectedCustomer>().updateData(response.data);
        setState(() {
          widget.notificationBar.showMessage(MessagesProvider.get('Updated the primary details successfully.'),AppColors.notificationBGLightBlueColor);
        });
       // Navigator.pop(context);
      }
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      setState(() {
        widget.notificationBar.showMessage(errorString??'',Colors.red);
      });
    }
  }

  _addContact(ContactDTO contactDTO,bool add) async{
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);

    try{
      var response = add ?  await customerSearchBL.addContact(
          customerId: data?.id ?? -1,
          contactDTO: contactDTO
      ) : await customerSearchBL.updateContact(
          customerId: data?.id ?? -1,
          contactDTO: contactDTO
      ) ;

      if(response.exception == null) {
        _setLoadingStatus(false);
        setState(() {
        });
        // Navigator.pop(context);
      }
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'].toString();
      setState(() {
        widget.notificationBar.showMessage(errorString??'',Colors.red);
      });
      //Future.microtask(() => _showErrorDialog(context, 'Error', errorString ?? ''));
    }
  }


  _addAddress(AddressDTO addressDTO,bool add) async{
    _setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);

    try{
      var response = add ?  await customerSearchBL.addAddress(
          customerId: data?.id ?? -1,
          addressDTO: addressDTO
      ) : await customerSearchBL.updateAddress(
          customerId: data?.id ?? -1,
          addressDTO: addressDTO
      ) ;

      if(response.exception == null) {
        _setLoadingStatus(false);
        setState(() {

        });
        // Navigator.pop(context);
      }
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'].toString();
      setState(() {
        widget.notificationBar.showMessage(errorString??'',Colors.red);
      });
    }
  }
  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  _showContactDialog(String title, ContactDTO? contactList, int index,bool add){
    _contactCtr.text = contactList?.attribute1 ?? "";
    _attribute2Ctr.text = contactList?.attribute2 ?? "";
    bool? _isChecked = contactList?.isActive ?? true;
    bool? _isDefaultChecked = contactList?.isDefault ?? true;
    _contactType =  contactList?.contactType ?? 2;
    int _contactTypeId = (_contactType == 1 || _contactType == 2)?(_contactType == 1) ? 2 :1:-1;
    bool isChanged = add ? false : true;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (_) => StatefulBuilder(
            builder: (context, setState) {
              return AddContactDialog(title: title,
                contactController: _contactCtr,
                formKey: _contactFormKey,
                value: _contactType,
                phoneSubTypeCtr: _phoneSubTypeCtr,
                countryCodeCtr: _countryCodeCtr,
                attribute2: _attribute2Ctr,
                isChecked: _isChecked,
                isDefaultChecked: _isDefaultChecked,
                onDefaultCheck: (value){
                  _isDefaultChecked = value;
                },
                onCheck: (value){
                  _isChecked = value;
                },
                onChange: (value){
                  _contactType = value!;
                  _contactTypeId = (_contactType == 1) ? 2 :1;
                },
                onPress: (){
                  if (_contactFormKey.currentState!.validate()) {
                    Log.v("contact type $_contactType $_contactTypeId");
                    setState((){
                      var contactDTO = ContactDTO(id: contactList?.id ?? -1, profileId: data?.profileId ?? -1,
                          addressId: contactList?.addressId ?? -1, countryId: contactList?.countryId ?? -1,
                          contactSubTypeId: contactList?.contactSubTypeId ?? -1, contactTypeId: _contactTypeId,
                          contactType: _contactType,
                          contactSubType: contactList?.contactSubType ?? -1, attribute1: _contactCtr.text, attribute2: _attribute2Ctr.text,
                          isActive: _isChecked ?? true,
                          isDefault: _isDefaultChecked ?? true, createdBy: contactList?.createdBy ?? "", creationDate: contactList?.creationDate ?? "",
                          lastUpdatedBy: contactList?.lastUpdatedBy ?? "", lastUpdateDate: contactList?.lastUpdatedBy ?? "",
                          siteId: contactList?.siteId ?? -1, masterEntityId: contactList?.masterEntityId ?? -1,
                          synchStatus: contactList?.synchStatus ?? false, guid: contactList?.guid ?? "", uuid: contactList?.uuid ??  "",
                          whatsAppEnabled: contactList?.whatsAppEnabled ?? false, isVerified: contactList?.isVerified ?? false,
                          isChanged: isChanged);
                      if(contactList != null){
                        _contactList?[index] = contactDTO;
                      }else{
                        _contactList?.add(contactDTO);
                      }
                      _addContact(contactDTO,add);
                      Navigator.pop(context);
                    });
                  }
                },);
            }
        ));
  }

  _showAddressDialog(String title, AddressDTO? addressList,int index,bool add){
    bool? _isChecked = addressList?.isActive ?? true;
    bool? _isDefaultChecked = addressList?.isDefault ?? true;
    _addressCtr.text = addressList?.postalCode ?? "";
    _addressTypeCtr.text = addressList?.addressType ==1 ?MessagesProvider.get('Work'):MessagesProvider.get('Home');
    _addressLine1Ctr.text = addressList?.line1 ?? "";
    _addressLine2Ctr.text = addressList?.line2 ?? "";
    _addressLine3Ctr.text = addressList?.line3 ?? "";
    _addressCityCtr.text = addressList?.city ?? "";
    _addressStateCtr.text = addressList?.stateName ?? "";
    _addressCountryCtr.text = addressList?.countryName ?? "";
    bool isChanged = add ? false : true;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (_) => StatefulBuilder(
            builder: (context, setState) {
              return AddAddressDialog(
                title: title,
                addressController: _addressCtr,
                formKey: _addressFormKey,
                isChecked : _isChecked,
                onCheck: (value){
                  _isChecked = value;
                },
                onPress: (){
                  if (_addressFormKey.currentState!.validate()) {
                    setState((){
                      var addressDTO = AddressDTO(id: addressList?.id ?? -1, profileId: addressList?.profileId ?? -1,
                        addressTypeId: addressList?.addressTypeId ?? 1, addressType: _addressTypeCtr.text == MessagesProvider.get('Work') ?1:2,
                        stateId: _state?.stateId ?? -1, countryId: _country?.countryId ?? -1,
                        isActive: _isChecked ?? true,
                        creationDate: addressList?.creationDate ?? "", lastUpdateDate: addressList?.lastUpdateDate ?? "",
                        siteId: addressList?.siteId ??-1, masterEntityId: addressList?.masterEntityId ?? -1,
                        synchStatus: addressList?.synchStatus ??  false, isDefault: _isDefaultChecked ??  true,
                        contactDTOList: addressList?.contactDTOList ?? [], isChanged: isChanged,
                        isChangedRecursive: isChanged,postalCode: _addressCtr.text,line1: _addressLine1Ctr.text,
                        line2: _addressLine2Ctr.text,line3: _addressLine3Ctr.text,city: _addressCityCtr.text,
                        stateName: _state?.state,countryName: _country?.countryName,
                      );
                      if(addressList != null){
                        _addressList?[index] = addressDTO;
                      }else{
                        _addressList?.add(addressDTO);
                      }
                      _addAddress(addressDTO, add);
                      _addressCtr.text = "";
                      Navigator.pop(context);
                    });
                  }
                },
                onLinkPress: () {
                _showContactDialog(MessagesProvider.get("New Contact"),null,-1,true);
              },
                onCountryChanged: (value){
                  _country =value;
                },
                onStateChanged: (value){
                  _state = value;
                },
                addressTypeController: _addressTypeCtr,
                addressLine1Controller: _addressLine1Ctr,
                addressLine2Controller: _addressLine2Ctr,
                addressLine3Controller: _addressLine3Ctr,
                addressCityController: _addressCityCtr,
                addressStateController: _addressStateCtr,
                addressCountryController: _addressCountryCtr,
                isDefaultChecked: _isDefaultChecked,
                onDefaultCheck: (value){
                  _isDefaultChecked = value;
                }, country: _country ,
                state: _state,);
            }
        ));
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(title,style: theme.titleLight3?.copyWith(color: theme.secondaryColor),),
          ),
          content: Text(message,style: theme.titleLight3?.copyWith(color: theme.secondaryColor),),
          actions: [
            CupertinoDialogAction(
              child: Text(MessagesProvider.get("ok"),style: theme.titleLight3?.copyWith(color: theme.secondaryColor),),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        barrierDismissible: true);
  }


  Future<void> _initDropDownList() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var membershipDataBl = await MembershipDataBuilder.build(execContextDTO!);
    var memberShip = await membershipDataBl.callMembershipDataApi();
    List<MembershipContainerDTO>? _membershipList = memberShip.data?.membershipContainerDTOList;
    if(data?.membershipId != -1){
      _membershipCtr.text = _membershipList?.firstWhere((element) => element.membershipId == data?.membershipId).membershipName ?? "";
    }
  }

  _isFieldEnabled() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    _ignoreBirthYear = await masterDataBL.getDefaultValuesByName(defaultValueName: 'IGNORE_CUSTOMER_BIRTH_YEAR');
    final titleResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TITLE');
    final idProofResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CUSTOMER_PHOTO');
    final middleNameResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'MIDDLE_NAME');
    final lastNameResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'LAST_NAME');
    final nickNameResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'NICKNAME');
    final genderResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'GENDER');
    final birthdayResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'BIRTH_DATE');
    final anniversaryResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ANNIVERSARY');
    final uniqueIdentifierResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'UNIQUE_ID');
    final rightHandedResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'RIGHTHANDED');
    final teamUserResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TEAMUSER');
    final companyResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'COMPANY');
    final designationResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'DESIGNATION');
    final taxCodeResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'TAXCODE');
    final notesResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'NOTES');
    final extSysResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'EXTERNALSYSTEMREF');
    final channelResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CHANNEL');
    final typeResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CUSTOMERTYPE');
    final usernameResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'USERNAME');
    print('TITLE  : '+ idProofResponse!);
    if (data != null) {
      var birthDate = data?.dateOfBirth ?? '';
      var anniversary = data?.anniversary ?? '';
      if (birthDate != '') {
        DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
        DateTime tempDate = dateFormat.parse(birthDate);
        String dob = _ignoreBirthYear == "Y"?   DateFormat("dd-MM").format(tempDate) : DateFormat("dd-MM-yyyy").format(tempDate);
        _dobNameCtr.text = dob.toString() ?? "";
      }
      if (anniversary != '') {
        DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
        DateTime tempDate = dateFormat.parse(anniversary);
        String dob = _ignoreBirthYear == "Y"?   DateFormat("dd-MM").format(tempDate) : DateFormat("dd-MM-yyyy").format(tempDate);
        _anniversaryCtr.text = dob.toString() ?? "";
      }
      _addressList = data?.addressDTOList?.toList() ?? [];
      _contactList = data?.contactDTOList?.toList() ?? [];
    }
    setState(() {
      _titleView = titleResponse;
      _idProofView = idProofResponse;
      _middleNameView = middleNameResponse;
      _lastNameView = lastNameResponse;
      _nickNameView = nickNameResponse;
      _genderView = genderResponse;
      _birthdateView = birthdayResponse;
      _anniversaryView = anniversaryResponse;
      _uniqueIdView = uniqueIdentifierResponse;
      _rightHandView = rightHandedResponse;
      _teamUserView = teamUserResponse;
      _companyView = companyResponse;
      _designationView = designationResponse;
      _taxCodeView = taxCodeResponse;
      _notesView = notesResponse;
      _extSysView = extSysResponse;
      _channelView = channelResponse;
      _typeView = typeResponse;
      _usernameView = usernameResponse;
    });
  }
  _showNotification(String s) {
    setState(() {
      widget.notificationBar.showMessage(s,Colors.red);
    });
  }
}

