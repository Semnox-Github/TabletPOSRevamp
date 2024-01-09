import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orders_data/models/facility_container/facility_container_dto.dart';
import 'package:orders_data/models/table_search_data/table_search_data.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class TableListItem extends StatefulWidget{

  int selectedIndex = 0;
  int index = 0;
  final Function(int value) onChange;
  TableSearchData? data;
  String? facility;
  String? status;
  List<FacilityContainerDTO>? facilityList;

  TableListItem({required this.selectedIndex, required this.index,required this.onChange,
  this.data,this.facility,this.status,this.facilityList});

  @override
  State<TableListItem> createState() => _TableListItemState();
}

class _TableListItemState extends State<TableListItem> {

  String _tableName = "";
  String _mergedTableName = "";
  int _capacity = -1;
  String _elapsedTimeInHours = "";

  @override
  void initState() {
    super.initState();
     _elapsedTimeInHours = getTimeStringFromDouble(widget.data?.elapsedTimeInMinutes ?? 0.0);
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    _findFacility();
    if(widget.selectedIndex == widget.index){
      selectedOuterTableName.value = _tableName;
    }
    return Visibility(
      visible:  true,
      //visible: ((widget.data?.tableCurrentStatus ?? "") == widget.status) ? true : false,
      child: GestureDetector(
        onTap: ()=>{
            setState((){
              widget.selectedIndex = widget.index;
              widget.onChange(widget.index);
            })
          },
        child: Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          padding: EdgeInsets.symmetric(vertical: SizeConfig.isBigDevice() ? SizeConfig.getSize(20) : SizeConfig.getSize(16)) ,
          decoration: BoxDecoration(
              border:  (widget.selectedIndex == widget.index) ? Border.all(color: theme.secondaryColor!) : null,
              borderRadius: BorderRadius.circular(8),
              color:  theme.listTileBG
          ),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(widget.data?.tableId.toString() ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 2,
                  child: Text(_tableName,style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 2,
                  child: Text(_capacity != -1 ? _capacity.toString() : "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 2,
                  child: Text(widget.facility ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,)),
              Expanded(
                  flex: 3,
                  child: Text(widget.data?.status ?? "",style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 3,
                  child: Text(_elapsedTimeInHours,style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),
              Expanded(
                  flex: 3,
                  child: Text(_mergedTableName,style: theme.subtitle3?.copyWith(color : theme.secondaryColor,fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),textAlign : TextAlign.center,overflow: TextOverflow.ellipsis,)),

            ],
          ),
        ),
      ),
    );
  }

  String getTimeStringFromDouble(double value) {
    final time = value.toInt();
   int hourValue = (time/60).toInt();
   final minuteString = time % 60;
    return '$hourValue:$minuteString';
  }


  _findFacility(){
    if(widget.facilityList != null){
      int len = widget.facilityList?.length ?? 0;
      for (int i = 0; i < len; i++) {
        var item = widget.facilityList?[i];
        if(item?.facilityId == widget.data?.facilityId){
          widget.facility = item?.facilityName;
          var len2 = item?.facilityTableContainerDTOList.length ?? 0;
          var facilityItem = item?.facilityTableContainerDTOList;
          if(len2 > 0){
            for(int j = 0; j < len2; j++){
              if(facilityItem?[j].tableId == widget.data?.tableId){
                _tableName = facilityItem?[j].tableName ?? "";
                _capacity = facilityItem?[j].maxCheckIns ?? -1;
              }
              if(facilityItem?[j].tableId == widget.data?.mergedWithTableId){
                _mergedTableName = facilityItem?[j].tableName ?? "";
              }
            }
          }
        }
      }
    }
  }
}