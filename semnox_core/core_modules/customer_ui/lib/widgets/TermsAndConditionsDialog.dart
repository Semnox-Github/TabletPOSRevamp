import 'package:customer_data/builder.dart';
import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/relationships/customer_relationship_data.dart';
import 'package:customer_data/models/relationships/update_relationship_request.dart';
import 'package:customer_ui/providers/SelectedCustomerNameProvider.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:customer_ui/utils/AppColors.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/widgets/ContactWidget.dart';
import 'package:customer_ui/widgets/CustomNamePicker.dart';
import 'package:customer_ui/widgets/CustomerButtonWidget.dart';
import 'package:customer_ui/widgets/CustomerDatePicker.dart';
import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';
import 'package:notificationbar_ui/NotificationBar.dart';





class TermsAndConditionsDialog extends StatefulWidget {
  TextEditingController addressController;
  VoidCallback? onPress;
  String title;
  bool? isChecked = true;
  bool isEdit;
  CustomerRelationshipData? relationData;
  Function(bool? value)? onCheck;

  var formKey = GlobalKey<FormState>();

  TermsAndConditionsDialog(
      {required this.title,
        required this.addressController,
        this.onPress,
        this.isChecked,
        this.onCheck,
        required this.formKey, this.relationData, required  this.isEdit});

  @override
  State<TermsAndConditionsDialog> createState() => _TermsAndConditionsDialogState();
}

class _TermsAndConditionsDialogState extends State<TermsAndConditionsDialog> {
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
    return Scaffold(
      bottomNavigationBar:  Container(
        child: _notificationBar,
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AlertDialog(
            title: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Text(
                widget.title.toUpperCase(),
                style: AppStyle.hintTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            content: _widget(),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    color: Colors.black45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    CustomerDialogButton(
                      text: MessagesProvider.get("Cancel").toUpperCase(),
                      background: false,
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 20,),
                    CustomerDialogButton(
                      text: 'agree'.toUpperCase(),
                      onPress: (){

                      },
                    )
                  ],)

                ],
              ),

            ],
          )),
            //.withLoader(isLoading: _isLoading),
    );
  }



  _widget() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.9,
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Container(
              height: 1,
              color: Colors.black45,
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

      if(response.exception == null) {
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
       /* Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) =>
                  CustomerDetailsPage(source:1)),);*/
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
              child: Text(MessagesProvider.get("Ok"),style: AppStyle.titleStyle,),
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
