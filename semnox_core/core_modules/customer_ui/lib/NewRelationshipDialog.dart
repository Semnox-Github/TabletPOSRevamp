import 'package:customer_data/builder.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/relationships/customer_relationship_data.dart';
import 'package:customer_data/models/relationships/update_relationship_request.dart';
import 'package:customer_ui/providers/SelectedCustomerNameProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/ContactWidget.dart';
import 'package:customer_ui/widgets/CustomNamePicker.dart';
import 'package:customer_ui/widgets/CustomerButtonWidget.dart';
import 'package:customer_ui/widgets/CustomerDatePicker.dart';
import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:provider/provider.dart';
import 'package:messages_data/builder.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';


import 'CustomerDetailsPage.dart';



class NewRelationshipDialog extends StatefulWidget {
  TextEditingController addressController;
  VoidCallback? onPress;
  String title;
  bool? isChecked = true;
  bool isEdit;
  CustomerRelationshipData? relationData;
  Function(bool? value)? onCheck;

  var formKey = GlobalKey<FormState>();

  NewRelationshipDialog(
      {required this.title,
        required this.addressController,
        this.onPress,
        this.isChecked,
        this.onCheck,
        required this.formKey, this.relationData, required  this.isEdit});

  @override
  State<NewRelationshipDialog> createState() => _NewRelationshipDialogState();
}

class _NewRelationshipDialogState extends State<NewRelationshipDialog> {
  final _customerNameCtr = TextEditingController();
  final _effectiveDateCtr = TextEditingController();
  final _expireDateCtr = TextEditingController();
  final _dropdownCtr = TextEditingController();
  TextEditingController _dropdownHintCtr = TextEditingController();
  late NotificationBar _notificationBar;


  CustomerData? selectedCustomerData;
  CustomerData? data;
  bool _isLoading = false;



  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(showHideSideBar: false);
    if(widget.isEdit){
     setState(() {
       _customerNameCtr.text = widget.relationData?.relatedCustomerName.toString()??'';

       if(widget.relationData?.effectiveDate != null)
       {
          _effectiveDateCtr.text =widget.relationData?.effectiveDate==null?'':(DateFormat('MM-dd-yyyy').format(DateTime.parse(widget.relationData?.effectiveDate ?? '-')) ?? '').toString() ?? "0.0";

       }
       if(widget.relationData?.expiryDate != null )
       {
          _expireDateCtr.text =widget.relationData?.expiryDate==null?'':(DateFormat('MM-dd-yyyy').format(DateTime.parse(widget.relationData?.expiryDate ?? '-')) ?? '').toString() ?? "0.0";

        }
       _dropdownHintCtr.text = widget.relationData?.customerRelationshipTypeId == 7 ?'Spouse':widget.relationData?.customerRelationshipTypeId == 8? 'Child': widget.relationData?.customerRelationshipTypeId == 9?'Friend':'Select';
     });
    }
    else{
      context.read<SelectedCustomerName>().updateData(null);
      _dropdownHintCtr.text = 'Select';
    }
    Future.microtask(() => _initDropDownList());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedCustomerData = context.watch<SelectedCustomerName>().selectedData;
    data = context.watch<SelectedCustomer>().selectedData;
    if(!widget.isEdit) {
      _customerNameCtr.text = selectedCustomerData?.firstName ?? "";
    }
  }
  @override
  void dispose() {
    super.dispose();
    context.read<SelectedCustomerName>().updateData(null);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Scaffold(
      bottomNavigationBar:  Container(
        child: _notificationBar,
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AlertDialog(
            backgroundColor: theme.backGroundColor,
            title: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Text(
                widget.title.toUpperCase(),
                style: theme.heading5?.copyWith(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.start,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            content: _widget(),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Container(
                // height:  MediaQuery.of(context).size.height,
                height: SizeConfig.getSize(60),
                width: MediaQuery.of(context).size.width * 0.10,
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    backgroundColor: theme.button1BG1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                  child: Text(
                    MessagesProvider.get("Cancel").toUpperCase(),
                    style: theme.headingLight5?.copyWith(
                        color: theme.secondaryColor,
                        fontSize: SizeConfig.getFontSize(16),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                // height:  MediaQuery.of(context).size.height,
                height: SizeConfig.getSize(60),
                width: MediaQuery.of(context).size.width * 0.10,
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ElevatedButton(
                  onPressed: (){
                    _notificationBar.showMessage(
                        '',
                        theme.primaryColor!);
                    if(_isFromDateGreater()){
                      _notificationBar.showMessage(
                          'Effective date must be less than the expiry date.',
                          AppColors.notificationBGRedColor);
                    }else{
                      if(!(_dropdownCtr.text == 'Spouse' ||_dropdownCtr.text == 'Child' ||_dropdownCtr.text == 'Friend' || widget.isEdit)){
                        _notificationBar.showMessage(
                            'Please select Relationship Type for this customer',
                            AppColors.notificationBGRedColor);
                      }else{
                        if(widget.isEdit){
                          UpdateRelationshipRequest updateRelationshipRequest = UpdateRelationshipRequest(
                            customerId: data?.id,
                            customerName: widget.relationData?.customerName,
                            relatedCustomerId: widget.relationData?.relatedCustomerId,
                            relatedCustomerName: widget.relationData?.relatedCustomerName,
                            customerRelationshipTypeId: _dropdownCtr.text == 'Spouse'?7:_dropdownCtr.text == 'Child'?8:_dropdownCtr.text == 'Friend'?9:widget.relationData?.customerRelationshipTypeId,
                            effectiveDate: _effectiveDateCtr.text,
                            expiryDate: _expireDateCtr.text,
                            isActive: widget.isChecked,
                            customerDto: widget.relationData?.customerDTO,
                            relatedCustomerDto: widget.relationData?.relatedCustomerDTO,
                            isChanged: true,

                          );
                          _addOrUpdateRelationship(widget.isEdit,updateRelationshipRequest);
                        }
                        else{
                          UpdateRelationshipRequest updateRelationshipRequest = UpdateRelationshipRequest(
                            customerId: data?.id ,
                            customerName: data?.firstName,
                            relatedCustomerId: selectedCustomerData?.id,
                            relatedCustomerName: selectedCustomerData?.firstName,
                            customerRelationshipTypeId: _dropdownCtr.text == 'Spouse'?7:_dropdownCtr.text == 'Child'?8:_dropdownCtr.text == 'Friend'?9:7,
                            effectiveDate: _effectiveDateCtr.text,
                            expiryDate: _expireDateCtr.text,
                            isActive: widget.isChecked,
                            customerDto: data,
                            relatedCustomerDto: selectedCustomerData,
                            isChanged: false,
                          );
                          _addOrUpdateRelationship(widget.isEdit,updateRelationshipRequest);
                        }
                      }
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    backgroundColor: theme.button2BG1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                  child: Text(
                    MessagesProvider.get("Confirm").toUpperCase(),
                    style: theme.headingLight5?.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.getFontSize(16),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          )).withLoader(isLoading: _isLoading,theme: theme),
    );
  }

  bool _isFromDateGreater(){
    if(_effectiveDateCtr.text == '' || _expireDateCtr.text == ''){
      return false;
    }else{
    DateTime dt1 = DateTime.parse(_getFormattedDate(_effectiveDateCtr.text));
    DateTime dt2 = DateTime.parse(_getFormattedDate(_expireDateCtr.text));
    return dt1.compareTo(dt2) > 0 ? true: false;
  }
  }

  String _getFormattedDate(String text) {
    var inputFormat = DateFormat('MM-dd-yyyy');
    var date1 = inputFormat.parse(text);
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(date1);
  }

  _widget() {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Container(
              height: 1,
              color:theme.dividerColor,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              checkColor:theme.secondaryColor,
                              activeColor: theme.backGroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) =>
                                 BorderSide(width: 1.0, color: theme.secondaryColor!),
                              ),
                              //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                              value: widget.isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.isChecked = value!;
                                 // widget.relationData?.relatedCustomerDTO.isActive = value!;
                                  widget.onCheck!(widget.isChecked);
                                });
                              },
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(-15, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                MessagesProvider.get("IsActive"),
                                style: theme.heading5?.copyWith(
                                    fontSize: 14.0,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              MessagesProvider.get('Type'),
                              style: theme.heading5?.copyWith(
                                fontSize: 16.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700
                            ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: DropdownButtonFormField<String>(
                              style: theme.heading5?.copyWith(
                                  fontSize: 14.0,
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
                              items: <String>['Spouse', 'Child', 'Friend']
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
                                  _dropdownHintCtr.text,
                                  style: TextStyle(color: theme.secondaryColor),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _dropdownHintCtr.text = value!;
                                  _dropdownCtr.text =value;
                                });
                              },
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomerNamePicker(MessagesProvider.get("Name"), MessagesProvider.get("Enter"), _customerNameCtr),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomerDatePicker(title : MessagesProvider.get("Effective Date"),
                        hint : MessagesProvider.get('Select'), controller :  _effectiveDateCtr,isBrithDate : false),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         CustomerDatePicker(title : MessagesProvider.get("Expire Date"),
            hint : MessagesProvider.get('Select'),controller :  _expireDateCtr,isBrithDate : false),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 1,
              color: theme.dividerColor,
            ),
          ],
        ),
      ),
    );
  }

  _addOrUpdateRelationship(bool isEdit,UpdateRelationshipRequest updateRelationshipRequest) async{
    //_setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);
    _setLoadingStatus(true);
    try{
      Log.printMethodStart('_addOrUpdateRelationship()', 'New Relationship Dialog','Save');
      var response = isEdit ?  await customerSearchBL.updateRelationships(
          customerId: data?.id ?? -1,
          updateRelationshipRequest: CustomerRelationshipData(
            id:widget.relationData?.id,
            customerId:widget.relationData?.customerId,
            customerName:widget.relationData?.customerName,
            relatedCustomerId:widget.relationData?.relatedCustomerId,
            relatedCustomerName:widget.relationData?.relatedCustomerName,
            customerRelationshipTypeId: _dropdownHintCtr.text == 'Spouse'?7:_dropdownHintCtr.text == 'Child'?8:_dropdownHintCtr.text == 'Friend'?9:widget.relationData?.customerRelationshipTypeId,
            effectiveDate:_effectiveDateCtr.value.text,
            expiryDate:_expireDateCtr.value.text,
            isActive:widget.isChecked,
            createdBy:widget.relationData?.createdBy,
            creationDate:widget.relationData?.creationDate,
            lastUpdatedBy:widget.relationData?.lastUpdatedBy,
            lastUpdateDate: widget.relationData?.lastUpdateDate,
            siteId: widget.relationData?.siteId,
            masterEntityId: widget.relationData?.masterEntityId,
            synchStatus: widget.relationData?.synchStatus,
            guid: widget.relationData?.guid,
            customerDTO: widget.relationData?.customerDTO as CustomerData,
            relatedCustomerDTO: widget.relationData?.relatedCustomerDTO as CustomerData,
            isChanged: true
          )
      ) : await customerSearchBL.addOrUpdateRelationships(
          customerId: data?.id ?? -1,
          updateRelationshipRequest: updateRelationshipRequest
      ) ;
      Log.printMethodEnd('_addOrUpdateRelationship()', 'New Relationship Dialog','Save');

      if(response.exception == null) {
        Log.printMethodReturn('_addOrUpdateRelationship() - Add Or Update Relationship done', 'New Relationship Dialog','Save');
        _setLoadingStatus(false);
        setState(() {

        });
        // Navigator.pop(context);
      }
      else{

      }
      _setLoadingStatus(true);
      setState(() {
        Navigator.pop(context);
        Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) =>
                  CustomerDetailsPage(source:1)),);
      });
    }on DioError catch(error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      _notificationBar.showMessage(
          errorString ?? '',
          AppColors.notificationBGRedColor);
     // Future.microtask(() => _showErrorDialog(context, 'Error', errorString ?? ''));
    }
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
    if(selectedCustomerData?.membershipId != -1  ){
      setState(() {
        //_customerNameCtr.text = data?.firstName ?? "";
      });    }
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

}
