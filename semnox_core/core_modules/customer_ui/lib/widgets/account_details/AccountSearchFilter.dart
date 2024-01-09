import 'package:customer_data/builder.dart';
import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_dto.dart';
import 'package:customer_data/models/loyalty_attribute_container/loyalty_attribute_container_response.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';


class AccountsSearchFilter extends StatefulWidget{


  Function(dynamic)? onChange;
  Function(dynamic)? onChangeNonZeroBalance;
  Function(dynamic)? onChangeCurrentEffective;
  Function(dynamic)? onChangeMembershipReward;
  bool nonZeroBalance = true;
  bool currentEffective = true;
  bool membershipReward = false;
  List<LoyaltyAttributeContainerDTO>? loyaltyAttribute;

  AccountsSearchFilter({
      this.onChange,
      this.onChangeNonZeroBalance,
      this.onChangeCurrentEffective,
      this.onChangeMembershipReward,
      required this.nonZeroBalance,
      required this.currentEffective,
      required this.membershipReward});

  @override
  State<AccountsSearchFilter> createState() => _AccountsSearchFilterState();
}

class _AccountsSearchFilterState extends State<AccountsSearchFilter> {
  String? validationText;
  dynamic value;
 // List<DropdownMenuItem> item = <DropdownMenuItem<LoyaltyAttributeContainerDTO>>[];
  final item = <DropdownMenuItem<LoyaltyAttributeContainerDTO>>[];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
      Future.microtask(() => _initDropDown(theme));
    });

  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      children: [
        Visibility(
          visible: widget.onChange != null,
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
              padding: const EdgeInsets.only(top: 14.0, ),
              decoration: BoxDecoration(
                  border:   null,
                  borderRadius: BorderRadius.circular(8),
                  color: theme.tableRow1
              ),
              child: DropdownButtonFormField(
                items:  item,
               /* <String>['All', 'Cash', 'Card Balance', 'Counter Items Only','Loyalty Points','Game Play Credits','Game Play Bonus'
                    'Tickets','Time','Virtual Points'].map((String value) {
              return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: AppStyle.customerText,),
              );
          }).toList(),*/
                onChanged: widget.onChange,
                value: value,
                validator: (value){
                  return null;
                },
                hint: Text(MessagesProvider.get("Type")),
                dropdownColor: theme.tableRow1,
                isDense: true,
                decoration: value == null ?  InputDecoration(
                  label: Text(MessagesProvider.get("Type"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.tableRow1!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.tableRow1!),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                ) :
                InputDecoration(
                  label: Text(MessagesProvider.get("Type"), style: theme.subtitleLight2?.copyWith(color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.tableRow1!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: theme.tableRow1!),
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                ) ,
                icon: Image.asset('assets/down_arrow_white.png', height: 20, width: 15, color: value == null ? Colors.grey : theme.secondaryColor,),
                isExpanded: true,),
            ),
          ),
        ),
        const SizedBox(width: 4.0,),
        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Transform.scale(
                scale: 1.2,
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
                  value: widget.nonZeroBalance,
                  onChanged:widget.onChangeNonZeroBalance,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(MessagesProvider.get("Non-Zero Balance"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),),
              ),
            ],
          ),
        )),
        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 4.0,),
              Transform.scale(
                scale: 1.2,
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
                  value: widget.currentEffective,
                  onChanged:widget.onChangeCurrentEffective,
                ),
              ),
              Text(MessagesProvider.get("Current Effective"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),overflow: TextOverflow.ellipsis,),
            ],
          ),
        )),
        Expanded(child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 4.0,),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  checkColor: theme.secondaryColor,
                  activeColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 1.0, color: theme.secondaryColor!),
                  ),
                  //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                  value: widget.membershipReward,
                  onChanged: widget.onChangeMembershipReward,
                ),
              ),
              Text(MessagesProvider.get("Membership Reward"),style: theme.textFieldHintStyle?.copyWith(color : theme.secondaryColor, fontSize: SizeConfig.getFontSize(18)),overflow: TextOverflow.ellipsis,),
            ],
          ),
        )),
        const SizedBox(width: 8.0,),
      ],
    );
  }

  _initDropDown(SemnoxTheme theme) async{
    SizeConfig.init(context);
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    final customerSearchBL = await CustomerDataBuilder.build(execContextDTO!);
    LoyaltyAttributeContainerResponse? response = await customerSearchBL.getLoyaltyAttribute();
    widget.loyaltyAttribute = response?.data?.loyaltyAttributeContainerDTO;
    if((widget.loyaltyAttribute?.length ?? 0) > 0){
      var item1 = LoyaltyAttributeContainerDTO(loyaltyAttributeId: -1, attribute: "All", purchaseApplicable: '',
          consumptionApplicable: '', dBColumnName: 'all', creditPlusType: '');
      value = item1;
      item.add(DropdownMenuItem(
          value: item1,
          child: AutoSizeText(item1.attribute.toString() ?? "",
              style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)))));
    }
    widget.loyaltyAttribute?.forEach((element) {
      item.add(DropdownMenuItem(
          value: element,
          child: AutoSizeText(element.attribute.toString() ?? "",
              style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)))));
    });
    setState(() {

    });
  }
}