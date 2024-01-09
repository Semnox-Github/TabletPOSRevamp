import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/configurations/configuration_response.dart';
import 'package:master_data/models/configurations/parafait_default_container_dto.dart';
import 'package:orders_data/models/orders_data/orders_data.dart';
import 'package:intl/intl.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../Screens/AllOrdersScreen.dart';

class OrderListItem extends StatefulWidget {
  bool actionMode = false;
  Function(dynamic, dynamic)? onCheckChange;
  Function(int value) onChange;
  Function(int value)? onRetrieve;
  int index = 0;
  int selectedIndex = 0;
  int checkedIndex = -1;
  OrdersData? data;
  String? dateFormat;
  OrdersData? dataNext;
  List<int>? selectedOrderIds;

  OrderListItem(
      {required this.actionMode,
      this.onCheckChange,
      required this.onChange,
      required this.selectedIndex,
      required this.checkedIndex,
      required this.index,
      this.data,
      this.onRetrieve,
      this.dateFormat,
      this.dataNext,
      this.selectedOrderIds});

  @override
  State<OrderListItem> createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var orderedTime;
    if (widget.data?.orderDate != null || widget.data?.orderDate != "") {
      var parsedDate = DateTime.parse(
          widget.data?.orderDate.toString() ?? "1974-03-20 00:00:00.000");
      orderedTime = DateFormat('dd-MMM-yyyy hh:mm:ss a').format(parsedDate);
      orderedTime = DateFormat(widget.dateFormat).format(parsedDate);
    }
    return Container(
      margin: EdgeInsets.only(
          top: (widget.selectedOrderIds != null &&
                      widget.selectedOrderIds!
                          .contains(widget.data?.orderId ?? 0)) &&
                  widget.selectedOrderIds?.length != 1
              ? 3.0
              : widget.selectedOrderIds?.length == 1
                  ? 2
                  : 8.0),
      decoration: (widget.selectedOrderIds != null &&
              widget.selectedOrderIds!.contains(widget.data?.orderId ?? 0))
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: theme.listTileBG)
          : BoxDecoration(
              border: (widget.selectedOrderIds != null &&
                          widget.selectedOrderIds!
                              .contains(widget.data?.orderId ?? 0)) ||
                      (widget.selectedIndex == widget.index)
                  ? Border.all(color: theme.secondaryColor!)
                  : null,
              // border:  ((widget.selectedIndex == widget.index) && (orderIdFromAllOrdersScreen.value == widget.data?.orderId.toString()))
              //     || ((widget.data?.orderId.toString() == widget.dataNext?.orderId.toString()) || (widget.selectedIndex == widget.index)) ?
              // Border.all(color: theme.secondaryColor!) : null,
              borderRadius: BorderRadius.circular(8),
              color: theme.listTileBG),
      child: GestureDetector(
        onTap:  widget.actionMode
                ? () => {
                      if (widget.actionMode)
                        {
                          setState(() {
                            widget.selectedIndex = widget.index;
                            widget.onChange(widget.index);
                          })
                        }
                    }
                : () => {
                      widget.onRetrieve!(widget.index),
                    },
        child: SizedBox(
          child:  Row(
            children: [
              Expanded(
                  flex: 1,
                  child: widget.data?.orderId.toString() ==
                      widget.dataNext?.orderId.toString()
                      ? Container()
                      : Checkbox(
                    checkColor: theme.secondaryColor,
                    activeColor: theme.backGroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                          width: 1.0, color: theme.secondaryColor!),
                    ),
                    //fillColor: MaterialStateProperty.resolveWith(Colors.black),
                    value: ((widget.checkedIndex == widget.index) &&
                        (widget.selectedIndex == widget.index) &&
                        _isChecked) ||
                        ( widget.selectedOrderIds?.contains(widget.data!.orderId) == true)
                        ? true
                        : false,
                    onChanged: (bool? value) {
                      if (widget.actionMode) {
                        setState(() {
                          _isChecked = value!;
                          widget.selectedIndex = widget.index;
                          widget.checkedIndex = widget.index;
                          widget.onChange(widget.index);
                          widget.onCheckChange!(widget.index, _isChecked);
                        });
                      }
                    },
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    widget.data?.orderId.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    widget.data?.orderStatus.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    widget.data?.tentNumber.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    widget.data?.guestName.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    widget.data?.guestContactNumber.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    orderedTime.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    widget.data?.transactionId == -1
                        ? ""
                        : widget.data?.transactionId.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    widget.data?.transactionAmount
                        .toStringAsFixed(2)
                        .toString() ??
                        "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),
        ),
     ),


    // child :  ListTile(
    //       dense: true,
    //       contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
    //       title: Row(
    //         children: [
    //           Expanded(
    //               flex: 1,
    //               child: widget.data?.orderId.toString() ==
    //                       widget.dataNext?.orderId.toString()
    //                   ? Container()
    //                   : Checkbox(
    //                       checkColor: theme.secondaryColor,
    //                       activeColor: theme.backGroundColor,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(5.0),
    //                       ),
    //                       side: MaterialStateBorderSide.resolveWith(
    //                         (states) => BorderSide(
    //                             width: 1.0, color: theme.secondaryColor!),
    //                       ),
    //                       //fillColor: MaterialStateProperty.resolveWith(Colors.black),
    //                       value: ((widget.checkedIndex == widget.index) &&
    //                                   (widget.selectedIndex == widget.index) &&
    //                                   _isChecked) ||
    //                           ( widget.selectedOrderIds?.contains(widget.data!.orderId) == true)
    //                           ? true
    //                           : false,
    //                       onChanged: (bool? value) {
    //                         if (widget.actionMode) {
    //                           setState(() {
    //                             _isChecked = value!;
    //                             widget.selectedIndex = widget.index;
    //                             widget.checkedIndex = widget.index;
    //                             widget.onChange(widget.index);
    //                             widget.onCheckChange!(widget.index, _isChecked);
    //                           });
    //                         }
    //                       },
    //                     )),
    //           Expanded(
    //               flex: 2,
    //               child: Text(
    //                 widget.data?.orderId.toString() ?? "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //           Expanded(
    //               flex: 2,
    //               child: Text(
    //                 widget.data?.orderStatus.toString() ?? "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //           Expanded(
    //               flex: 2,
    //               child: Text(
    //                 widget.data?.tentNumber.toString() ?? "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //           Expanded(
    //               flex: 2,
    //               child: Text(
    //                 widget.data?.guestName.toString() ?? "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //           Expanded(
    //               flex: 2,
    //               child: Text(
    //                 widget.data?.guestContactNumber.toString() ?? "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //           Expanded(
    //               flex: 3,
    //               child: Text(
    //                 orderedTime.toString() ?? "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //           Expanded(
    //               flex: 2,
    //               child: Text(
    //                 widget.data?.transactionId == -1
    //                     ? ""
    //                     : widget.data?.transactionId.toString() ?? "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //           Expanded(
    //               flex: 2,
    //               child: Text(
    //                 widget.data?.transactionAmount
    //                         .toStringAsFixed(2)
    //                         .toString() ??
    //                     "",
    //                 style: theme.subtitle3?.copyWith(
    //                     color: theme.secondaryColor,
    //                     fontWeight: FontWeight.w500,
    //                     fontSize: SizeConfig.getFontSize(16)),
    //                 textAlign: TextAlign.center,
    //                 overflow: TextOverflow.ellipsis,
    //               )),
    //         ],
    //       ),
    //       onTap: widget.actionMode
    //           ? () => {
    //                 if (widget.actionMode)
    //                   {
    //                     setState(() {
    //                       widget.selectedIndex = widget.index;
    //                       widget.onChange(widget.index);
    //                     })
    //                   }
    //               }
    //           : () => {
    //                 widget.onRetrieve!(widget.index),
    //               }),
    );
  }
}







class OrderListItemWidget extends StatefulWidget {
  OrderListItemWidget(
      {Key? key,
      this.dateFormat,
      required this.currentIndex,
      required this.orderGroup,
      required this.actionMode,
      required this.onRetrieve,
      required this.onCheckChange,
      required this.onSelect,
      })
      : super(key: key);
  final int currentIndex;
  final OrdersGroup orderGroup;
  final bool actionMode;
  String? dateFormat;
  Function(OrdersData? data)  onRetrieve;
  Function(int, bool,int) onCheckChange;
  Function(List<OrdersData>,int) onSelect;
  @override
  State<OrderListItemWidget> createState() => _OrderListItemWidgetState();
}

class _OrderListItemWidgetState extends State<OrderListItemWidget> {
  List<OrdersData> selectList = [];
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: theme.listTileBG,
          border: Border.all(
              color:
                 widget.orderGroup.isCheck  == false ? theme.listTileBG! : theme.secondaryColor!,
              width: 3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //check box
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap:() {
                    if(!widget.actionMode) { return; }
                    widget.onCheckChange(widget.orderGroup.orderId,widget.orderGroup.isCheck == true ? true : false,widget.currentIndex);
                    },
                  child: Container(
                    margin: EdgeInsets.all(SizeConfig.getSize(8)),
                    height: SizeConfig.getSize(40),
                    width: SizeConfig.getSize(40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(SizeConfig.getSize(6))),
                        border: Border.all(
                            width: SizeConfig.getWidth(1),
                            color: widget.actionMode == true
                                ? theme.secondaryColor!
                                : theme.secondaryColor!.withOpacity(0.5)),
                        color: Colors.white),
                    child: widget.orderGroup.isCheck == true
                        ? Image.asset(
                            "assets/check.png",
                            color: theme.secondaryColor,
                            width: SizeConfig.getSize(40),
                            height: SizeConfig.getSize(40),
                          )
                        : const SizedBox(),
                  )),
            ],
          ),

          //List

          Flexible(
            child: Container(
              padding: EdgeInsets.all(SizeConfig.getSize(5)),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(2)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                    widget.orderGroup.orderList?.length ?? 0, (index) {
                  return InkWell(
                      child: OrderListInnerChild(
                    dateFormat: widget.dateFormat,
                    data: widget.orderGroup.orderList![index],
                  ),
                  onTap:() {
                    if(widget.actionMode) {
                     if(!widget.orderGroup.isCheck){
                        selectList.clear();
                        selectList.add(widget.orderGroup.orderList[index]!);
                        widget.onSelect(selectList,widget.currentIndex);
                     }
                      return;
                    }else {
                      selectList.clear();
                      widget.onRetrieve(widget.orderGroup.orderList[index]);
                    }
                  } ,
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OrderListInnerChild extends StatelessWidget {
  OrderListInnerChild({
    Key? key,
    required this.data,
    this.dateFormat,
  })
      : super(key: key);
  final OrdersData? data;
  String? dateFormat;
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    var orderedTime;
    if (data?.orderDate != null || data?.orderDate != "") {
      var parsedDate = DateTime.parse(
          data?.orderDate.toString() ?? "1974-03-20 00:00:00.000");
      orderedTime = DateFormat('dd-MMM-yyyy hh:mm:ss a').format(parsedDate);
      orderedTime = DateFormat(dateFormat).format(parsedDate);
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      padding: EdgeInsets.symmetric(vertical: SizeConfig.getSize(10)),
      decoration: BoxDecoration(

           border: data!.isSelected ? Border.all(color: theme.secondaryColor!) : null ,
          // // border:  ((widget.selectedIndex == widget.index) && (orderIdFromAllOrdersScreen.value == widget.data?.orderId.toString()))
          // //     || ((widget.data?.orderId.toString() == widget.dataNext?.orderId.toString()) || (widget.selectedIndex == widget.index)) ?
          // // Border.all(color: theme.secondaryColor!) : null,
          borderRadius: BorderRadius.circular(SizeConfig.isBigDevice() ? 8 : 4),
          color:theme.listTileBG),
      child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Text(
                    data?.orderId.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    data?.orderStatus.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    data?.tentNumber.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    data?.guestName.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    data?.guestContactNumber.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 3,
                  child: Text(
                    orderedTime.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    data?.transactionId == -1
                        ? ""
                        : data?.transactionId.toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              Expanded(
                  flex: 2,
                  child: Text(
                    data?.transactionAmount.toStringAsFixed(2).toString() ?? "",
                    style: theme.subtitle3?.copyWith(
                        color: theme.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.getFontSize(16)),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
            ],
          ),


    );
  }
}
