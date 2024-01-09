import 'package:customer_data/models/country_container/country_container_dto.dart';
import 'package:customer_data/models/country_container/state_container_dto.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/CustomerFormWidget.dart';
import 'package:customer_ui/widgets/registration/NewDropDownWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';


class NewAddress extends StatefulWidget{

  VoidCallback? onAdd;
  VoidCallback? onRemove;
  Function(dynamic)? onChangeCountry;
  Function(dynamic)? onChangeState;
  TextEditingController? line1Ctr;
  TextEditingController? line2Ctr;
  TextEditingController? line3Ctr;
  TextEditingController? cityCtr;
  TextEditingController? postalCodeCtr;
  List<DropdownMenuItem<CountryContainerDTO>> countries;
  List<DropdownMenuItem<StateContainerDTO>> states;
  String? address1View;
  String? address2View;
  String? address3View;
  String? cityView;
  String? stateView;
  String? countryView;
  String? pinView;
  dynamic? countryValue;
  bool isDefault;
  Function(dynamic) onChangeDefault;


  NewAddress({super.key, this.onAdd, this.onRemove,
    this.onChangeCountry,
    this.onChangeState,
    this.line1Ctr,this.line2Ctr,this.line3Ctr,this.cityCtr,this.postalCodeCtr,
  required this.countries,required this.states,
    this.countryValue,
    this.address1View,this.address2View,this.address3View,this.cityView,this.stateView,this.countryView,this.pinView,
    required this.isDefault,
    required this.onChangeDefault
  });

  @override
  State<NewAddress> createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {

  var _types = <DropdownMenuItem<String>>[];
  bool _isChecked = false;
  List<DropdownMenuItem<StateContainerDTO>> _states = [];

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
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          //padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: theme.dialogFooterInnerShadow!,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex:3,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                            child: Container()),
                        Expanded(
                            flex: 6,
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20.0,),
                            Text( MessagesProvider.get("* "), style:  theme.heading5 ),
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 1.5,
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
                                    onChanged:(bool? value) {
                                      setState(() {
                                        _isChecked = value!;
                                        widget.isDefault = value;
                                        widget.onChangeDefault(value);
                                      });
                                    }
                                  ),
                                ),
                                Text(MessagesProvider.get("Default"),style:  theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal),overflow: TextOverflow.ellipsis,),
                              ],
                            ),
                           /*  CheckboxListTile(
                              title: Text(MessagesProvider.get("default"),style:  theme.heading5,overflow: TextOverflow.ellipsis,),
                              value: false,
                              onChanged: (newValue) {  },
                              controlAffinity: ListTileControlAffinity.leading,
                              shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),*/
                            NewDropDownWidget(title: MessagesProvider.get("* ")+MessagesProvider.get("Type"),hint: MessagesProvider.get("Select ")+MessagesProvider.get("Type"),
                              item: _types,
                              value: MessagesProvider.get("Work"),
                              onChange: (value){

                              },),
                          ],
                        )),
                        Expanded(
                          flex: 2,
                            child: Container()),
                      ],
                    )
        ),
                Container(
                  width: 1,
                  color: theme.dialogFooterInnerShadow,
                  //margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                Expanded(
                  flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                      children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomerFormWidget(title : (widget.address1View == 'M' ?MessagesProvider.get("* ") : '')+MessagesProvider.get("Line1"),
                                  hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Line1"),
                                  controller : widget.line1Ctr,enable : true,
                                  visible: (widget.address1View == 'M' || widget.address1View == 'O') ? true :false,
                                  validation: widget.address1View == 'M' ? MessagesProvider.get("Enter ") + MessagesProvider.get("Line3"):null,
                                ),
                              ),
                              const SizedBox(width: 8.0,),
                              Expanded(
                                child: CustomerFormWidget(
                                    title : (widget.address2View == 'M' ?MessagesProvider.get("* ") : '') +MessagesProvider.get("Line2"),
                                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Line2"),
                                    visible: (widget.address2View == 'M' || widget.address2View == 'O') ? true :false,
                                    controller : widget.line2Ctr,enable : true,
                                  validation: widget.address2View == 'M' ?MessagesProvider.get("Enter ") + MessagesProvider.get("Line3"):null,

                                ),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomerFormWidget(
                                    title : (widget.address3View == 'M' ?MessagesProvider.get("* ") : '') + MessagesProvider.get("Line3"),
                                    hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Line3"),
                                    visible: (widget.address3View == 'M' || widget.address3View == 'O') ? true :false,
                                    controller : widget.line3Ctr,enable : true,
                                  validation: widget.address3View == 'M' ?MessagesProvider.get("Enter ") + MessagesProvider.get("Line3"):null,
                                ),
                              ),
                              const SizedBox(width: 8.0,),
                              Expanded(
                                child: CustomerFormWidget(
                                  title :(widget.cityView == 'M' ? MessagesProvider.get("* ") : '')+MessagesProvider.get("City"),
                                  hint : MessagesProvider.get("Enter ") + MessagesProvider.get("City"),
                                  controller : widget.cityCtr,enable : true,
                                  visible: (widget.cityView == 'M' || widget.cityView == 'O') ? true :false,
                                  validation : widget.cityView == 'M' ?MessagesProvider.get("Enter ") + MessagesProvider.get("City"):null,),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: (widget.stateView == 'M' || widget.stateView == 'O') ? true :false,
                                child: NewDropDownWidget(title: (widget.stateView == 'M' ?MessagesProvider.get("* ") : '') + MessagesProvider.get("State"),
                                  hint: MessagesProvider.get("Select ")+MessagesProvider.get("State"),
                                validation: (widget.address2View == 'M' ? MessagesProvider.get("Select ") + MessagesProvider.get("State") : ''),
                                item: _states,
                                onChange: widget.onChangeState,),
                              ),
                              const SizedBox(width: 8.0,),
                              Visibility(
                                visible: (widget.countryView == 'M' || widget.countryView == 'O') ? true :false ,
                                child: NewDropDownWidget(
                                  title:(widget.countryView == 'M' ?MessagesProvider.get("* ") : '')+MessagesProvider.get("Country"),
                                  hint: MessagesProvider.get("Select ")+MessagesProvider.get("Country"),
                                  validation : widget.countryView == 'M' ?  MessagesProvider.get("Select ") + MessagesProvider.get("Country") : null,
                                  item: widget.countries,
                                value: widget.countryValue,
                                onChange: (value){
                                  setState(() {
                                    CountryContainerDTO country = value;
                                    _states.clear();
                                    widget.states.forEach((element) {
                                      if(element.value?.countryId == country.countryId){
                                        _states.add(element);
                                      }
                                    });
                                    widget.onChangeCountry!(value);
                                  });
                                },),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                              child: CustomerFormWidget(
                                title : (widget.pinView == 'M' ?MessagesProvider.get("* ") : '') + MessagesProvider.get("Postal Code"),
                                hint : MessagesProvider.get("Enter ") + MessagesProvider.get("Postal Code"),
                                controller : widget.postalCodeCtr,enable : true,
                                validation :widget.pinView == 'M' ? MessagesProvider.get("Enter") + MessagesProvider.get("Postal Code"):null,
                                visible:  (widget.pinView == 'M' || widget.pinView == 'O') ? true :false,
                                ),
                            ),
                            const SizedBox(width: 8.0,),
                            Expanded(child: Container())],
                          ),
                      ],
                ),
                    ))
              ],
            ),
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

  void _dropdownItems(){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    _types = <DropdownMenuItem<String>>[
      DropdownMenuItem(
          value: MessagesProvider.get("Work"),
          child: Text(MessagesProvider.get("Work"), style: theme.subtitle2?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(18)))),
      DropdownMenuItem(
          value: MessagesProvider.get("home"),
          child: Text(MessagesProvider.get("Home"), style: theme.subtitle2?.copyWith(fontWeight: FontWeight.w400,fontSize: SizeConfig.getFontSize(18)))),
    ];

    print("country and state ${widget.countryValue} ${widget.states}");
    widget.states.forEach((element) {
      if(element.value?.countryId == widget.countryValue){
        _states.add(element);
      }
    });

    setState(() {

    });
  }
}