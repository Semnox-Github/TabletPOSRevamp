import 'dart:ui';

import 'package:customer_data/builder.dart';
import 'package:customer_data/models/address_dto.dart';
import 'package:customer_data/models/contact_dto.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/relationships/customer_relationship_data.dart';
import 'package:customer_data/models/relationships/customer_relationship_response.dart';
import 'package:customer_ui/AddContactDialog.dart';
import 'package:customer_ui/NewRelationshipDialog.dart';
import 'package:customer_ui/providers/SelectedCardDetailsProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/CustomerNameCard.dart';
import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:membership_data/builder.dart';
import 'package:membership_data/models/membership_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:provider/provider.dart';
import 'package:logs_data/logger.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../../ListViewItems/RelationshipSearchListItem.dart';

class CustomerRelationship extends StatefulWidget{

  @override
  State<CustomerRelationship> createState() => _CustomerRelationshipState();
}

class _CustomerRelationshipState extends State<CustomerRelationship> {
  final _firstNameCtr = TextEditingController();
  final _middleNameCtr = TextEditingController();
  final _lastNameCtr = TextEditingController();
  final _dobNameCtr = TextEditingController();
  final _membershipCtr = TextEditingController();
  final _contactCtr = TextEditingController();
  final _addressCtr = TextEditingController();
  final _dropdownCtr = TextEditingController();
  final ScrollController _relationshipListController = ScrollController();
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
  int _selectedIndex = 0;

  bool _primaryDetailsView = true;
  bool _contactView = true;
  bool _addressView = true;
  CustomerData? data;
  bool _contactIsActive = true;
  bool _addressIsActive = true;
  bool _isChecked = true;
  CustomerRelationshipResponse? relationships;
  List<CustomerRelationshipData?>? _relationshipsData;
  List<CustomerRelationshipData?>? _relationshipsDataMain;
  CustomerRelationshipData? _selectedData;
  bool showData = false;
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();




  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    Future.microtask(() => _initDropDownList());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _membershipCtr.text = context.watch<SelectedCardDetails>().selectedData?.membershipName.toString() ?? '-';
    data = context.watch<SelectedCustomer>().selectedData;
    if(data != null){
      var birthDate = data?.dateOfBirth ?? '';
      if(birthDate != '') {
        DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
        DateTime tempDate = dateFormat.parse(birthDate);
        String dob = DateFormat("dd-MM-yyyy").format(tempDate);
        _dobNameCtr.text = dob.toString() ?? "";
      }
      _addressList = data?.addressDTOList?.toList() ?? [];
      _contactList = data?. contactDTOList?.toList() ?? [];
    }
    _firstNameCtr.text = data?.firstName ?? "";
    _middleNameCtr.text = data?.middleName ?? "";
    _lastNameCtr.text = data?.lastName ?? "";
    getCustomerRelationships(context);
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color:theme.backGroundColor,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomerNameCard(name:  "${_firstNameCtr.text}  ${_lastNameCtr.text}",membership: _membershipCtr.text.isNotEmpty?_membershipCtr.text:'-',),
              Row(
                children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 5),
                   child:  SizedBox(
                     width: SizeConfig.getSize(300),
                     child: Card(
                       elevation: 1,
                       color: theme.tableRow1,
                       child: Padding(
                         padding: const EdgeInsets.only(top: 5,bottom: 0,right: 5),
                         child: SizedBox(
                           width: SizeConfig.getSize(300),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                                Padding(
                                   padding: EdgeInsets.only(left: 8),
                                 child: Text(MessagesProvider.get('Type'),style: TextStyle(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.bold),),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(left: 8,bottom: 0),
                                 child: DropdownButtonFormField<String>(
                                   //underline: const SizedBox(height: 0,),
                                   dropdownColor:  theme.tableRow1,
                                   elevation: 0,
                                   decoration: InputDecoration.collapsed(hintText: ''),
                                   items: <String>[MessagesProvider.get('Spouse'), MessagesProvider.get('Child'), MessagesProvider.get('Friend'),MessagesProvider.get('All')].map((String value) {
                                     return DropdownMenuItem<String>(
                                       value: value,
                                       child: Text(value,style:TextStyle(fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),),
                                     );
                                   }).toList(),
                                  // icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                                   hint: Text(MessagesProvider.get('All'),
                                     style: TextStyle(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.bold),
                                   ),
                                   onChanged: (value) {
                                     setState(() {
                                       _dropdownCtr.text = value.toString();
                                       _addSearchFilter();
                                     });
                                   },
                                 ),
                               ),
                             ],
                           )
                         ),
                       ),
                     ),
                   ),
                 ),
                  Padding(
                    padding:   EdgeInsets.only(left: (MediaQuery.of(context).size.width*0.08)),
                  child: Visibility(
                    visible:  true,
                    child: Transform.scale(
                      scale: SizeConfig.getSize(2.9),
                      child: Checkbox(
                        checkColor:theme.secondaryColor,
                        activeColor: theme.backGroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                              (states) =>  BorderSide(width: 1.0, color: theme.secondaryColor!),
                        ),
                        //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                        value: _isChecked,
                        onChanged:(bool? value) {
                          setState(() {
                            _isChecked = value!;
                            _addSearchFilter();
                          });
                        } ,
                      ),
                    ),
                  ),
                  ),

                  Transform.translate(
                    offset: const Offset(-15, 0),
                    child: Visibility(
                        visible:  true,
                        child: Padding(padding:const EdgeInsets.all(15.0),child: Text(MessagesProvider.get("Active Only"),style:theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)),))),
                  ),

                  Flexible(
                    fit: FlexFit.loose,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                         height:  SizeConfig.getSize(60),
                        width: MediaQuery.of(context).size.width * 0.10,
                        padding:  const EdgeInsets.only(left: 8.0,right: 8.0),
                        child: ElevatedButton(
                          onPressed: () => {
                          _showNewRelatioshipDialog(MessagesProvider.get('title'), null, 1, true)
                          } ,
                          style: ElevatedButton.styleFrom(
                            padding:  const EdgeInsets.all(8.0),
                            backgroundColor: theme.button2BG1,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                          ),
                          child: Text(MessagesProvider.get('New'), style:AppStyle.customerTextBoldWhite.copyWith(fontSize: SizeConfig.getFontSize(16)),),),
                      )],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Scroller(
                  controller: _relationshipListController,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,right: 20),
                    child:  Card(
                      elevation: 1,
                      color: theme.tableRow1,
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: theme.secondaryColor!),borderRadius: BorderRadius.circular(6.0),),
                        child: Padding(
                          padding: const EdgeInsets.only(left:5,top: 5,bottom: 0,right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${_firstNameCtr.text} ${_lastNameCtr.text}',style :  theme.heading5?.copyWith( fontSize: SizeConfig.getFontSize(20),fontWeight: FontWeight.w700)),
                              Padding(
                                padding:  EdgeInsets.only(left: SizeConfig.getSize(20)),
                                child:  Card(
                                  elevation: 1,
                                  color: theme.backGroundColor,
                                  child: Container(
                                    decoration: BoxDecoration(border: Border.all(color: theme.secondaryColor!),borderRadius: BorderRadius.circular(6.0)),
                                    child:
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          dense: true,
                                          title: Padding(
                                            padding:  EdgeInsets.only(left: 0.0),
                                            child: Container(
                                            //  constraints: BoxConstraints(maxHeight: SizeConfig.getSize(260)),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(width: SizeConfig.getSize(30),),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: SizeConfig.getSize(0)),
                                                    child: Container(
                                                alignment:Alignment.topLeft,
                                                      height: SizeConfig.getSize(40),
                                                      width:SizeConfig.getSize(44),
                                                      child: Text(MessagesProvider.get('Id'),style: theme.heading5?.copyWith(
                                                          fontSize: SizeConfig.getFontSize(18),
                                                          fontWeight: FontWeight.w700
                                                      ),overflow: TextOverflow.ellipsis,),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.getSize(44),),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: SizeConfig.getSize(0)),
                                                    child: Container(
                                                      alignment:Alignment.topLeft,
                                                      height: SizeConfig.getSize(40),
                                                      width:SizeConfig.getSize(170),
                                                      child: Text(MessagesProvider.get('Related Customer'),style: theme.heading5?.copyWith(
                                                          fontSize: SizeConfig.getFontSize(18),
                                                          fontWeight: FontWeight.w700
                                                      ),overflow: TextOverflow.ellipsis,),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.getSize(5),),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: SizeConfig.getSize(0)),
                                                    child: Container(
                                                      alignment:Alignment.topLeft,
                                                      height: SizeConfig.getSize(40),
                                                      width:SizeConfig.getSize(60),
                                                      child: Text(MessagesProvider.get('Type'),style: theme.heading5?.copyWith(
                                                          fontSize: SizeConfig.getFontSize(18),
                                                          fontWeight: FontWeight.w700
                                                      ),overflow: TextOverflow.ellipsis,),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.getSize(50),),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: SizeConfig.getSize(0)),
                                                    child: Container(
                                                      alignment:Alignment.topLeft,
                                                      height: SizeConfig.getSize(40),
                                                      width:SizeConfig.getSize(120),
                                                      child: Text(MessagesProvider.get('Effective Date'),style:theme.heading5?.copyWith(
                                                          fontSize: SizeConfig.getFontSize(18),
                                                          fontWeight: FontWeight.w700
                                                      ),overflow: TextOverflow.ellipsis,),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.getSize(24),),
                                                  Padding(
                                                    padding: EdgeInsets.only(left: SizeConfig.getSize(0)),
                                                    child: Container(
                                                      alignment:Alignment.topLeft,
                                                      height: SizeConfig.getSize(40),
                                                      width:SizeConfig.getSize(100),
                                                      child: Text(MessagesProvider.get('Expiry Date'),style: theme.heading5?.copyWith(
                                                          fontSize: SizeConfig.getFontSize(18),
                                                          fontWeight: FontWeight.w700
                                                      ),overflow: TextOverflow.ellipsis,),
                                                    ),
                                                  ),
                                                  SizedBox(width: SizeConfig.getSize(40),),
                                                  Padding(padding: EdgeInsets.only(left: SizeConfig.getSize(0))),
                                                  Container(
                                                    alignment:Alignment.topLeft,
                                                    height: SizeConfig.getSize(40),
                                                    width:SizeConfig.getSize(100),
                                                    child: Text(MessagesProvider.get('Status'),style: theme.heading5?.copyWith(
                                                        fontSize: SizeConfig.getFontSize(18),
                                                        fontWeight: FontWeight.w700
                                                    ),overflow: TextOverflow.ellipsis,),
                                                  ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(0, -15),
                                          child: Container(
                                            constraints: BoxConstraints(maxHeight: SizeConfig.screenHeight*0.54),
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics: ScrollPhysics(),
                                                controller:_relationshipListController,
                                                itemCount: _relationshipsData?.length ?? 0,
                                                padding: const EdgeInsets.only(left:0,right: 0.0),
                                                itemBuilder: (BuildContext context, int index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(0.0),
                                                    child: RelatioshipSearchListItem(
                                                      selectedIndex: _selectedIndex, index: index,
                                                      data :_relationshipsData,
                                                      onChange: (value){
                                                        setState((){
                                                          _selectedIndex = value;
                                                          _selectedData = _relationshipsData?[_selectedIndex];
                                                        });
                                                      },),
                                                  );
                                                }),
                                          ),
                                        ),

                                      ],
                                    ),



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
              ),
            ],
          ),
        ),
      ),
    ).withLoader(isLoading: _isLoading,theme: theme);
  }

  Future getCustomerRelationships(BuildContext context) async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    _setLoadingStatus(true);
    final customerDataBl = await CustomerDataBuilder.build(execContext!);
    relationships = await customerDataBl.getCustomerRelationships(customerId: data?.id.toInt()?? 0);
    setState(() {
      _setLoadingStatus(false);
      _relationshipsData = relationships?.data?? [];
      _relationshipsDataMain = _relationshipsData;
      _selectedData = _relationshipsData![_selectedIndex];
      _addSearchFilter();
    });
    _setLoadingStatus(false);
    Log.v("Selected Customer ID : "+(data?.profileId ?? 0).toString());
    Log.v(_relationshipsData);
    Log.v("showData : "+showData.toString());

  }

  void _addSearchFilter() {
    List<CustomerRelationshipData> data = List.from(_relationshipsDataMain!);
    if (_dropdownCtr.text != 'All') {
      if(_dropdownCtr.text == 'Spouse'){
        data.removeWhere((element) =>
        element.customerRelationshipTypeId == 8 || element.customerRelationshipTypeId == 9);
      }
      if(_dropdownCtr.text == 'Child'){
        data.removeWhere((element) =>
        element.customerRelationshipTypeId == 7 || element.customerRelationshipTypeId == 9);
      }
      if(_dropdownCtr.text == 'Friend'){
        data.removeWhere((element) =>
        element.customerRelationshipTypeId == 7 || element.customerRelationshipTypeId == 8);
      }

    }
    if(_isChecked){
      data.removeWhere((element) =>
      element.isActive == false);
    }

    _relationshipsData = data;
    if(data.isEmpty){
      showData = false;
    }else{
      showData = true;
    }

  }







  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }


  _showNewRelatioshipDialog(String title, AddressDTO? addressList,int index,bool add){
    bool? _isChecked = addressList?.isActive ?? true;
    _addressCtr.text = addressList?.postalCode ?? "";
    bool isChanged = add ? false : true;
    showDialog(context: context,
        barrierDismissible: false,
        builder: (_) => StatefulBuilder(
            builder: (context, setState) {
              return NewRelationshipDialog(
                title: "NEW RELATIONSHIP",
                addressController: _addressCtr,
                formKey: _addressFormKey,
                isChecked : _isChecked,
                isEdit: false,
                onCheck: (value){
                  _isChecked = value;
                },
                onPress: (){

                },
              );
            }
        ));
  }

  _showErrorDialog(BuildContext context, String title, String message) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(title,style: AppStyle.titleStyle,),
          ),
          content: Text(message,style: AppStyle.titleStyle,),
          actions: [
            CupertinoDialogAction(
              child: Text(MessagesProvider.get("OK"),style: AppStyle.titleStyle,),
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
}