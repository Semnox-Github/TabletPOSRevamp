import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/facility_table_status_container/facility_table_status_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_data/builder.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_ui/Screens/FreeTableScreen.dart';
import 'package:orders_ui/providers/SelectedFacilityProvider.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

ValueNotifier<FacilityContainerDTO?> setFacility = ValueNotifier(null);

class TableFilters extends StatefulWidget{

  VoidCallback? onClear;
  VoidCallback? onSearch;
  Function(dynamic)? onFacilityChange;
  Function(dynamic)? onStatusChange;
  TextEditingController? capacityController;
  String? pageName;
  var statusValue;
  bool? cleared = false;
  FacilityContainerDTO? facilityValue;

  TableFilters({super.key,
    this.pageName,
    this.cleared,
    this.facilityValue,
    this.onClear,this.onSearch,this.onFacilityChange,this.onStatusChange,this.capacityController});

  @override
  State<TableFilters> createState() => _TableFiltersState();
}

class _TableFiltersState extends State<TableFilters> {
 // final _status = <DropdownMenuItem<FacilityTableStatusContainerDTO>>[];
  //final _facilities = <DropdownMenuItem<FacilityContainerDTO>>[];
  final _facilities = <FacilityContainerDTO>[];
  final _status = <FacilityTableStatusContainerDTO>[];
  FacilityTableStatusContainerDTO? _statusValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initDropdownList();
    });

  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
     mainAxisAlignment: MainAxisAlignment.start,
     crossAxisAlignment: CrossAxisAlignment.end,
     children: [
       Expanded(child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(MessagesProvider.get("Facility"), style: theme.heading5?.copyWith(fontWeight:FontWeight.w400,fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,
           overflow: TextOverflow.ellipsis,),
           SizeConfig.isBigDevice() ? const SizedBox(height: 8.0,) : const SizedBox() ,
           Container(
             height: MediaQuery.of(context).size.height/13,
             child: Theme(
               data: ThemeData(
                   textTheme: TextTheme(subtitle1: TextStyle(fontSize: SizeConfig.getFontSize(15)))
               ),
               child: ButtonTheme(
                 alignedDropdown: true,
                 child: Stack(
                   children: [
                     DropdownSearch<String>(
                       popupProps: PopupProps.menu(
                         showSearchBox: true,
                         fit: FlexFit.loose,
                       ),
                       items: _facilities.map<String>((item) => item.facilityName.toString()).toList(),
                       dropdownDecoratorProps: DropDownDecoratorProps(
                         baseStyle: theme.heading5?.copyWith(
                             fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                         dropdownSearchDecoration: InputDecoration(
                           hintText: "All",
                           hintStyle: theme.heading5?.copyWith(
                                     fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                           border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8.0),
                             borderSide: BorderSide(color: theme.dividerColor!, width: SizeConfig.screenWidth/1000),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8.0),
                             borderSide: BorderSide(color: theme.dividerColor!, width: SizeConfig.screenWidth/1000),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(8.0),
                             borderSide: BorderSide(color: theme.dividerColor!, width: SizeConfig.screenWidth/1000),
                           ),
                           contentPadding: EdgeInsets.fromLTRB(SizeConfig.screenHeight/40, SizeConfig.screenHeight/40, 0, 0),
                         ),
                       ),
                       onChanged: (value) {
                         final _value = _facilities.firstWhere((element) =>
                         element.facilityName.toString().toLowerCase() ==
                             value.toString().toLowerCase());
                         print(_value);
                         widget.facilityValue = _value;
                         context.read<SelectedFacility>().updateFacility(_value);
                         widget.onFacilityChange!(_value);
                       },
                     ),
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Align(
                         alignment: Alignment.centerRight,
                         child: Container(
                           height: MediaQuery.of(context).size.height/14,
                           width: 20,
                           color: theme.backGroundColor,
                           child: Center(
                             child: Icon(Icons.arrow_drop_down_outlined,size: 15,color: Colors.grey,),
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ),
           ),
           /*DropdownButtonFormField(
             items: //_facilities,
             _facilities.map<DropdownMenuItem<FacilityContainerDTO>>((item) => DropdownMenuItem(
                 value: item,
                 child: Text(item.facilityName.toString(),
                     style: theme.heading5?.copyWith(
                         fontSize: SizeConfig.isBigDevice() ? SizeConfig.getFontSize(14) : SizeConfig.getFontSize(14),
                         fontWeight: FontWeight.w400),maxLines: 2,))).toList(),
             onChanged: (FacilityContainerDTO? value){
               print(value);
               widget.facilityValue = value;
               context.read<SelectedFacility>().updateFacility(value);
               widget.onFacilityChange!(value);
             },
             value: widget.facilityValue,
             isDense: true,
             isExpanded: true,
             style: theme.heading5,
             decoration: InputDecoration(
               hintText: "All",
               hintStyle: theme.heading5?.copyWith(color: theme.dividerColor,fontSize: SizeConfig.getFontSize(14)),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
               ),
               focusedBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(8.0),
                 borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
               ),
               isDense: true,
               contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
             ),
           )*/
         ],
       )),
       const SizedBox(width: 8.0,),
       Expanded(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(MessagesProvider.get("Status"), style: theme.heading5?.copyWith(fontWeight:FontWeight.w400,fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,
               overflow: TextOverflow.ellipsis,),
             SizeConfig.isBigDevice() ? const SizedBox(height: 8.0,) : const SizedBox() ,
             Container(
               height: MediaQuery.of(context).size.height/13,
               child: Theme(
                 data: ThemeData(
                     textTheme: TextTheme(subtitle1: TextStyle(fontSize: SizeConfig.getFontSize(15)))
                 ),
                 child: ButtonTheme(
                   alignedDropdown: true,
                   child: Stack(
                     children: [
                       DropdownSearch<String>(
                         popupProps: PopupProps.menu(
                           showSearchBox: true,
                           fit: FlexFit.loose,
                         ),
                         items: _status.map<String>((item) => item.statusCode.toString()).toList(),
                         dropdownDecoratorProps: DropDownDecoratorProps(
                           baseStyle: theme.heading5?.copyWith(
                               fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                           dropdownSearchDecoration: InputDecoration(
                             hintText: widget.pageName == 'free' ? "OPEN" :
                             widget.pageName == 'occupied' ? "OCCUPIED" :
                                  'All',
                             hintStyle: theme.heading5?.copyWith(
                                 fontSize: SizeConfig.getFontSize(14), fontWeight: FontWeight.w400),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(8.0),
                               borderSide: BorderSide(color: theme.dividerColor!, width: SizeConfig.screenWidth/1000),
                             ),
                             enabledBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(8.0),
                               borderSide: BorderSide(color: theme.dividerColor!, width: SizeConfig.screenWidth/1000),
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(8.0),
                               borderSide: BorderSide(color: theme.dividerColor!, width: SizeConfig.screenWidth/1000),
                             ),
                             contentPadding: EdgeInsets.fromLTRB(SizeConfig.screenHeight/40, SizeConfig.screenHeight/40, 0, 0),
                           ),
                         ),
                         onChanged: (value){
                           final _value = _status.firstWhere((element) =>
                           element.statusCode.toString().toLowerCase() ==
                               value.toString().toLowerCase());
                           print(_value);
                           setState(() {
                             status = _value;
                           });
                         },
                       ),
                       Padding(
                         padding: const EdgeInsets.only(right: 10),
                         child: Align(
                           alignment: Alignment.centerRight,
                           child: Container(
                             height: MediaQuery.of(context).size.height/14,
                             width: 20,
                             color: theme.backGroundColor,
                             child: Center(
                               child: Icon(Icons.arrow_drop_down_outlined,size: 15,color: Colors.grey,),
                             ),
                           ),
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
       const SizedBox(width: 8.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MessagesProvider.get("Capacity"), style: theme.heading5?.copyWith(fontWeight:FontWeight.w400,fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,),
            SizeConfig.isBigDevice() ? const SizedBox(height: 8.0,) : const SizedBox(),
            Container(
              height: MediaQuery.of(context).size.height/13,
              child: TextFormField(
                controller: widget.capacityController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),],
                keyboardType: TextInputType.number,
                readOnly: true,
                showCursor: true,
                onTap: () => showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: const Color(0x01000000),
                  builder: (BuildContext context) {
                    return NumberPad(
                      initialOffset: const Offset(50, 50),
                      title: '',
                      isZeroRequired: true,
                      onOkPressed: (value) {
                        widget.capacityController?.text = value.toString();
                      },
                    );
                  },
                ),
                style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18),fontWeight: FontWeight.w500),
                //theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: theme.dividerColor!, width: 1.0),
                  ),
                  hintText: MessagesProvider.get("Enter "),
                  isDense: true,
                  contentPadding: const EdgeInsets.fromLTRB(10, 0, 30, 30),
                ),
              ),
            )
          ],
        ),
      ),
       const SizedBox(width: 8.0,),
       Container(
         height: MediaQuery.of(context).size.height/13,
         margin: const EdgeInsets.only(bottom: 2.0),
         decoration: BoxDecoration(
           //color:  theme.cardStateUnselectedLight,
           color:  theme.tableRow1,
           borderRadius: BorderRadius.circular(8.0),
         ),
         child: IconButton(onPressed: widget.onSearch,
             padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
         constraints: const BoxConstraints(),
        icon: Image.asset("assets/ic_search.png", color : theme.secondaryColor)),
       ),
       const SizedBox(width: 8.0,),
       Container(
         height: MediaQuery.of(context).size.height/13,
         child: ElevatedButton(onPressed: widget.onClear,
          style: ElevatedButton.styleFrom(
            padding:  const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0.0),
               backgroundColor: theme.tableRow1,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
           ),
             child: Text(MessagesProvider.get("clear").toUpperCase(), style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(18)) ,textAlign: TextAlign.center,
               overflow: TextOverflow.ellipsis,)),
       )
     ],
    );
  }

  Future<void> _initDropdownList() async{
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    var posMachines = await  masterDataBL.getPosMachines();
    var posId = execContextDTO.machineId!;
    var facilityIdList = [];
    posMachines?.forEach((element) {
      if(element.posMachineId == posId){
        facilityIdList = element.facilityIdList;
      }
    });
    var list = await masterDataBL.getFacilityTableStatus();
    final ordersDataBL = await OrdersDataBuilder.build(execContextDTO);
    var faclilityList = await masterDataBL.getFacilities();

    if(widget.pageName == "unavailable"){
      var item1 = const FacilityTableStatusContainerDTO(facilityTableStatusId: -1,character: '',color: '',guid: '',statusCode: 'All',statusDescription: '',threshHoldAlertColorOne: '',
      threshHoldAlertColorThree: '',threshHoldAlertColorTwo: '',threshHoldCharacterOne: '',threshHoldCharacterThree: '',threshHoldCharacterTwo: '',trackTime: false);
      _statusValue = item1;
      widget.statusValue = item1;
      _status.add(item1);
    /*  _status.add(DropdownMenuItem(
          value: item1,
          child: AutoSizeText(item1.statusCode.toString(),
              style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
  */  }
    if (list != null) {
      for (int i = 0; i < list.length; i++) {
        var item = list[i];
        if(widget.pageName  == "occupied" && item.statusCode.toString() == "OCCUPIED") {
          _statusValue = item;
          _status.add(list[i]);
        /*  _status.add(DropdownMenuItem(
              value: item,
              child: AutoSizeText(item.statusCode.toString(),
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
    */    }else if(widget.pageName  == "free" && item.statusCode.toString() == "OPEN") {
          _statusValue = item;
          _status.add(list[i]);
       /*   _status.add(DropdownMenuItem(
              value: item,
              child: AutoSizeText(item.statusCode.toString(),
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
    */    }else if(widget.pageName  == "unavailable" && item.statusCode.toString() != "OPEN" && item.statusCode.toString() != "OCCUPIED"){
          _status.add(list[i]);
       /*   _status.add(DropdownMenuItem(
              value: item,
              child: AutoSizeText(item.statusCode.toString(),
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400))));
     */   }
      }
    }

    var item1 = const FacilityContainerDTO(facilityId: -1,facilityName: "All",description: "",activeFlag: false, allowMultipleBookings: false,
    externalSystemReference: "", guid: '', screenPosition: '', facilityType: -1,autoTableLayout: false,facilityTableContainerDTOList: [],
    imageFileName: '',interfaceName: -1,interfaceType: -1);
    _facilities?.add(item1);

   // widget.facilityValue =  item1 ;

    var firstList = List<int>.generate((faclilityList?.length ?? 0), (i) => faclilityList?[i].facilityId ?? 0);
    var thirdList = firstList.toSet().intersection(facilityIdList.toSet()).toList();
    var filtered = faclilityList?.where((e) => thirdList.contains(e.facilityId)).toList();
    _facilities.addAll(filtered as Iterable<FacilityContainerDTO>);

    /*if(faclilityList != null){
      for (int i = 0; i < faclilityList.length; i++) {
        _facilities.add(faclilityList[i]);
       *//* var item = faclilityList[i];
        _facilities.add(DropdownMenuItem(
              value: item,
              child: AutoSizeText(item.facilityName.toString(),
                  style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(14),fontWeight: FontWeight.w400),maxLines: 2,)));
     *//* }
    }*/
    setState(() {

    });
  }


}