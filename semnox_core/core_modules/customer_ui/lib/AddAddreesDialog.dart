import 'package:customer_data/builder.dart';
import 'package:customer_data/models/country_container/country_container_dto.dart';
import 'package:customer_data/models/country_container/country_container_response.dart';
import 'package:customer_data/models/country_container/state_container_dto.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/CustomerDialogButton.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:customer_ui/widgets/NewDropDownWidget.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:widgets_library/scroller.dart';

class  AddAddressDialog extends StatefulWidget{

  TextEditingController addressController;
  TextEditingController addressTypeController;
  TextEditingController addressLine1Controller;
  TextEditingController addressLine2Controller;
  TextEditingController addressLine3Controller;
  TextEditingController addressCityController;
  TextEditingController addressStateController;
  TextEditingController addressCountryController;
  VoidCallback? onPress;
  VoidCallback? onLinkPress;
  String title;
  bool? isChecked = true;
  bool? isDefaultChecked = true;
  Function(bool? value)? onCheck;
  Function(bool? value)? onDefaultCheck;
  var formKey = GlobalKey<FormState>();
  CountryContainerDTO? country;
  StateContainerDTO? state;
  Function(StateContainerDTO? value)? onStateChanged;
  Function(CountryContainerDTO? value)? onCountryChanged;



  AddAddressDialog({required this.title,required this.addressController, this.onPress,this.isChecked,this.onCheck,required this.formKey,
    required this.onLinkPress,required this.addressTypeController,required this.addressLine1Controller,required this.addressLine2Controller,
    required this.addressLine3Controller,this.onStateChanged,this.onCountryChanged,
    required this.addressCityController,required this.addressStateController,required this.addressCountryController,this.isDefaultChecked,this.onDefaultCheck,this.country,this.state
  });

  @override
  State<AddAddressDialog> createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<AddAddressDialog> {
  late List<DropdownMenuItem<CountryContainerDTO>> _countries = [];
  late List<DropdownMenuItem<StateContainerDTO>> _states   = [];
  final ScrollController _vertical = ScrollController();
  String? _address1View;
  String? _address2View;
  String? _address3View;
  String? _cityView;
  String? _stateView;
  String? _countryView;
  String? _pinView;

@override
  void initState() {
    super.initState();
    _isFieldEnabled();
}

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      Future.microtask(() => _getCountries(theme));
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return AlertDialog(
      title:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.title.toUpperCase(),style: theme.titleLight3?.copyWith(color : theme.secondaryColor),textAlign: TextAlign.start,),
          ),
          Container(height: 1,color:theme.dividerColor,),
        ],
      ),
      titlePadding:  const EdgeInsets.symmetric(horizontal: 0),
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: _widget(theme),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomerDialogButton(text: MessagesProvider.get("CANCEL").toUpperCase(), background: false,
          onPress: (){
          Navigator.pop(context);
        },),
        CustomerDialogButton(text: MessagesProvider.get("OK").toUpperCase(),onPress: widget.onPress ,),
        CustomerDialogButton(text: MessagesProvider.get("Link Contact").toUpperCase(),onPress: widget.onLinkPress ,)

      ],
    );
  }

  _widget(SemnoxTheme theme) {
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height*0.7,
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            Expanded(
             // height: MediaQuery.of(context).size.height *0.6,
              child: Scroller(
                controller: _vertical,
                child: SingleChildScrollView(
                  controller: _vertical,
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
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
                                    value: widget.isChecked,
                                    onChanged:(bool? value) {
                                      setState(() {
                                        widget.isChecked = value!;
                                        widget.onCheck!(widget.isChecked);
                                      });
                                    } ,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(MessagesProvider.get("IsActive"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor,fontSize: SizeConfig.getFontSize(20)),),
                                  ),
                                ],
                              ),
                                  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('*Type', style: true ? theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal) : AppStyle.customerDisableText,),
          const SizedBox(height: 4.0,),
          Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: DropdownButtonFormField<String>(
                    style: theme.heading5?.copyWith(
                        fontSize:SizeConfig.getFontSize(18),
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
                    items: <String>[MessagesProvider.get('Work'), MessagesProvider.get('Home')]
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
                        widget.addressTypeController.text ?? MessagesProvider.get('Work'),
                        style: TextStyle(color: theme.secondaryColor,fontSize: SizeConfig.getFontSize(18)),
                      ),
                    ),
                    onChanged: (value) {
                      widget.addressTypeController.text = value!;
                    },
                  ),
          ),
          const SizedBox(height: 10.0,)
        ],
      ),
                                  Visibility(
                                visible: (_address2View == 'M' || _address2View == 'O') ? true:false,
                                child: CustomerFormWidget(title : (_address2View == 'M' ?MessagesProvider.get("*"):'') + MessagesProvider.get("Line2"),hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Line2"),
                                    validation : _address2View == 'M'? MessagesProvider.get("Enter") + MessagesProvider.get("Line2"):null,
                                    controller : widget.addressLine2Controller,enable : true,keyboardType: TextInputType.name),
                              ),
                                  Visibility(
                                visible: (_cityView == 'M' || _cityView == 'O') ? true:false,
                                child: CustomerFormWidget(title : (_address2View == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("City"),hint : MessagesProvider.get("Enter ") + MessagesProvider.get("City"),
                                    validation :_cityView == 'M' ? MessagesProvider.get("Enter") + MessagesProvider.get("City"):null,
                                    controller : widget.addressCityController,enable : true,keyboardType: TextInputType.name),
                              ),
                                  Visibility(
                                    visible: (_countryView == 'M' || _countryView == 'O') ? true:false,
                                    child: NewDropDownWidget(
                                      title: (_countryView == 'M' ?MessagesProvider.get("*"):'') + MessagesProvider.get("Country"),
                                      hint: MessagesProvider.get("Select Country"),
                                    value: widget.country,
                                    item : _countries,
                                    onChange: (value){
                                      setState(() {
                                        CountryContainerDTO country = value;
                                        widget.country = country;
                                        widget.onCountryChanged!(value);
                                        _states.clear();
                                        country.stateContainerDTOList.forEach((stateElement) {
                                          _states.add(DropdownMenuItem(
                                              value: stateElement,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: theme.tableRow1
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    AutoSizeText(stateElement.description ?? "", style: theme.textFieldStyle),
                                                    const SizedBox(width: 8.0,),
                                                    AutoSizeText(stateElement.state ?? "", style: theme.textFieldStyle)
                                                  ],
                                                ),
                                              )));
                                        });
                                      });
                                    },),
                                  ),
                                ],
                        ),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
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
                                      value: widget.isDefaultChecked,
                                      onChanged:(bool? value) {
                                        setState(() {
                                          widget.isDefaultChecked = value!;
                                          widget.onDefaultCheck!(widget.isDefaultChecked);
                                        });
                                      } ,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(MessagesProvider.get("Default"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor),),
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: (_address1View == 'M' || _address1View == 'O') ? true:false,
                                  child: CustomerFormWidget(title : (_address1View == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Line1"), hint : MessagesProvider.get("Enter") + MessagesProvider.get("Line1"),
                                    controller : widget.addressLine1Controller,enable : true,validation : MessagesProvider.get("Enter") + MessagesProvider.get("Line1"),
                                    keyboardType: TextInputType.name ),
                                ),
                                Visibility(
                                  visible: (_address3View == 'M' || _address3View == 'O') ? true:false,
                                  child: CustomerFormWidget(title : (_address1View == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("Line3"), hint : MessagesProvider.get("Enter") + MessagesProvider.get("Line3"),
                                      controller : widget.addressLine3Controller,enable : true,validation : MessagesProvider.get("Enter") + MessagesProvider.get("Line3"),
                                      keyboardType: TextInputType.name ),
                                ),
                                Visibility(
                                  visible: (_stateView == 'M' || _stateView == 'O') ? true:false,
                                  child: NewDropDownWidget(title:(_address1View == 'M' ?MessagesProvider.get("*"):'') + MessagesProvider.get('State'), hint: MessagesProvider.get('Select State'),item : _states,
                                    value: widget.state,
                                  onChange: (value){
                                    widget.state = value;
                                    widget.onStateChanged!(value);
                                  },),
                                ),
                                Visibility(
                                  visible: (_pinView == 'M' || _pinView == 'O') ? true:false,
                                  child: CustomerFormWidget(title : (_pinView == 'M' ?MessagesProvider.get("*"):'') +MessagesProvider.get("PostalCode"), hint : MessagesProvider.get("Enter") + MessagesProvider.get("PostalCode"),
                                      controller : widget.addressController,enable : true,
                                      validation : MessagesProvider.get("Enter") + MessagesProvider.get("PostalCode"),
                                      keyboardType: TextInputType.number ),
                                )
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
            //const Spacer(),
            Container(height: 1,color: theme.dividerColor,),
          ],
        ),
      ),
    );
  }

  _getCountries(SemnoxTheme theme) async{
    final execContextBL = await ExecutionContextBuilder.build();
    final executionContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(executionContextDTO!);
    CountryContainerResponse? countryResponse = await customerSearchBL.getCountryContainer();
    List<CountryContainerDTO>? countryList = countryResponse?.data?.countryContainerDTOList;
    _countries.clear();
    countryList?.forEach((element) {
      _countries.add(DropdownMenuItem(
          value: element,
          child: AutoSizeText(element.countryName ?? "", style: theme.textFieldStyle)));
      element.stateContainerDTOList.forEach((stateElement) {
        _states.add(DropdownMenuItem(
            value: stateElement,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.tableRow1
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AutoSizeText(stateElement.description ?? "", style: theme.textFieldStyle),
                  const SizedBox(width: 8.0,),
                  AutoSizeText(stateElement.state ?? "", style: theme.textFieldStyle)
                ],
              ),
            )));
      });
    });
    setState(() {

    });
  }
  _isFieldEnabled() async {
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final address1Response = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ADDRESS1');
    final address2Response = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ADDRESS2');
    final address3Response = await masterDataBL.getDefaultValuesByName(defaultValueName: 'ADDRESS3');
    final cityResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'CITY');
    final stateResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'STATE');
    final countryResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'COUNTRY');
    final pinResponse = await masterDataBL.getDefaultValuesByName(defaultValueName: 'PIN');
    setState(() {
     _address1View = address1Response;
     _address2View = address2Response;
     _address3View = address3Response;
     _cityView = cityResponse;
     _stateView = stateResponse;
     _countryView = countryResponse;
     _pinView = pinResponse;
    });
  }

}