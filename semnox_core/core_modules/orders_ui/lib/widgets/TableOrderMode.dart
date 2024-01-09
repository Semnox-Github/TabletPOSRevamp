import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/widgets/OrderButton.dart';
import 'package:context_menu_data/builder.dart';
import 'package:context_menu_data/models/task_type_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class TableOrderMode extends StatefulWidget{

  VoidCallback? onRefresh;
  VoidCallback? onMerge;
  VoidCallback? onUnmerge;
  VoidCallback? onMove;
  VoidCallback? onDetails;
  VoidCallback? onReserve;
  VoidCallback? onBlock;
  VoidCallback? onClear;
  VoidCallback? onOrderMode;
  bool orderMode = true;

  TableOrderMode({super.key,this.onOrderMode, this.onRefresh, this.onMerge, this.onUnmerge, this.onMove,
      this.onDetails, this.onReserve, this.onBlock, this.onClear,required this.orderMode});

  @override
  State<TableOrderMode> createState() => _TableOrderModeState();
}

class _TableOrderModeState extends State<TableOrderMode> {
  bool _orderMode = true;
  final ScrollController _orderController = ScrollController();
  List<TaskTypesContainerDTO> dataList = [];
  bool mergeStatus = false;
  bool unMergeStatus = false;
  bool moveStatus = false;
  bool detailsStatus = false;
  bool reserveStatus = false;
  bool blockStatus = false;
  bool clearStatus = false;

  @override
  void initState() {
    super.initState();
    geActionButtons();
  }

  //var _orderMode = ValueNotifier<bool?>(false);
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      children: [
        /*ValueListenableBuilder(
          valueListenable: _orderMode,
          builder:(context,value,_){
            return OrderButton(title: (value ?? true) ?  StringsProvider.get("order_mode").toUpperCase() : StringsProvider.get("action_mode").toUpperCase() ,
              onPress: (){
                  _orderMode.value = !_orderMode.value!;
              },);
          } ,
        ),*/
        OrderButton(title: (widget.orderMode) ?  MessagesProvider.get("order\n mode").toUpperCase() : MessagesProvider.get("action\n mode").toUpperCase() ,
          onPress:widget.onOrderMode ),
        const SizedBox(width: 4.0,),
        OrderButton(title: MessagesProvider.get("refresh").toUpperCase(),
        onPress: widget.onRefresh),
        const SizedBox(width: 12.0,),
        CupertinoButton(
          minSize: double.minPositive,
          padding: EdgeInsets.zero,
          child:Row(
              children:[
                Image.asset('assets/back_arrow_white.png',color : (_orderController.hasClients &&  _orderController.position.pixels == _orderController.position.maxScrollExtent) ? theme.secondaryColor : theme.dividerColor, height: 22, width:12,fit: BoxFit.fitHeight),
                Image.asset('assets/back_arrow_white.png',color : (_orderController.hasClients &&  _orderController.position.pixels == _orderController.position.maxScrollExtent) ? theme.secondaryColor :   theme.dividerColor, height: 22,width:12,fit: BoxFit.fitHeight),
              ]
          ),
          onPressed: () {
            setState(() {
              scrollAnimated(0);
            });
          },
        ),
        const SizedBox(width: 12.0,),
        Expanded(
          flex: 7,
          child:  /* SingleChildScrollView(
           scrollDirection: Axis.horizontal,
           controller: _orderController,
           child: Row(
             children: [
               for(int i = 0; i < dataList.length; i++) ...[
                 OrderButton(title: dataList[i].taskType.toUpperCase(), onPress: widget.orderMode ? null : (){

                 },),
                 const SizedBox(width: 8.0,)
               ],
             ],
           ),
          ),*/
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _orderController,
            child: Row(
              children: [
                OrderButton(title: MessagesProvider.get("merge").toUpperCase(), onPress: widget.orderMode ? null : mergeStatus ?  widget.onMerge : null,),
                const SizedBox(width: 4.0,),
                OrderButton(title: MessagesProvider.get("unmerge").toUpperCase(), onPress: widget.orderMode ? null : unMergeStatus ?  widget.onUnmerge : null,),
                const SizedBox(width: 4.0,),
                OrderButton(title: MessagesProvider.get("move").toUpperCase(),  onPress: widget.orderMode ? null : moveStatus ?  widget.onMove : null,),
                const SizedBox(width: 4.0,),
                OrderButton(title: MessagesProvider.get("details").toUpperCase(), onPress: widget.orderMode ? null : detailsStatus ?  widget.onDetails : null,),
                const SizedBox(width: 4.0,),
                OrderButton(title: MessagesProvider.get("reserve").toUpperCase(),  onPress: widget.orderMode ? null :reserveStatus ?  widget.onReserve : null,),
                const SizedBox(width: 4.0,),
                OrderButton(title: MessagesProvider.get("block").toUpperCase(),  onPress: widget.orderMode ? null : blockStatus ?  widget.onBlock : null,),
                const SizedBox(width: 4.0,),
                OrderButton(title: MessagesProvider.get("clear").toUpperCase(),  onPress: widget.orderMode ? null :clearStatus ?  widget.onClear : null,),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0,),
        CupertinoButton(
          minSize: double.minPositive,
          padding: EdgeInsets.zero,
          child:Row(
            children: [
              Image.asset('assets/ic_right_arrow.png', color : (_orderController.hasClients && _orderController.position.pixels == _orderController.position.minScrollExtent) ? theme.secondaryColor :   theme.dividerColor ,height: 22, width:12,fit: BoxFit.fitHeight),
              Image.asset('assets/ic_right_arrow.png', color : (_orderController.hasClients &&  _orderController.position.pixels == _orderController.position.minScrollExtent) ? theme.secondaryColor :  theme.dividerColor ,height: 22, width:12,fit: BoxFit.fitHeight)
            ],
          ),
          onPressed: () {
             setState(() {
               scrollAnimatedMax();
            });
          },
        ),
        const SizedBox(width: 8.0,),
      ],
    );
  }

  void scrollAnimated(double position) {
    //_orderController.animateTo(position,curve: Curves.ease,duration:  Duration(seconds: 1));
    _orderController.animateTo(_orderController.position.minScrollExtent,curve: Curves.ease,duration:  const Duration(seconds: 1));
  }

  void scrollAnimatedMax() {
    _orderController.animateTo(_orderController.position.maxScrollExtent,curve: Curves.ease,duration:  const Duration(seconds: 1));
  }

  void geActionButtons() async{
    final execContextBL = await ExecutionContextBuilder.build();
    final execContext = execContextBL.getExecutionContext();
    final contextMenuBL = await ContextMenuDataBuilder.build(execContext!);
    Log.printMethodStart('geActionButtons() ', 'Orders Screen', 'init');
    var response = await contextMenuBL.callContextMenuApi();
    Log.printMethodEnd('geActionButtons() ', 'Orders Screen', 'init');
    Log.printMethodReturn('geActionButtons()-success', 'Orders Screen', 'init');
    Log.v("bottom response length ${response.data?.taskTypesContainerDtoList.length}");
    dataList.clear();
    response.data?.taskTypesContainerDtoList.forEach((element) {
      if(element.category.contains('TABLE FUNCTION')){
        dataList.add(element);
        if(element.taskType.toUpperCase().contains('MERGE') && element.displayInPos.contains('Y')){
          mergeStatus = true;
        }
        if(element.taskType.toUpperCase().contains('UNMERGE') && element.displayInPos.contains('Y')){
          unMergeStatus = true;
        }
        if(element.taskType.toUpperCase().contains('MOVE') && element.displayInPos.contains('Y')){
          moveStatus = true;
        }
        if(element.taskType.toUpperCase().contains('DETAILS') && element.displayInPos.contains('Y')){
          detailsStatus = true;
        }
        if(element.taskType.toUpperCase().contains('RESERVE') && element.displayInPos.contains('Y')){
          reserveStatus = true;
        }
        if(element.taskType.toUpperCase().contains('BLOCK') && element.displayInPos.contains('Y')){
          blockStatus = true;
        }
        if(element.taskType.toUpperCase().contains('CLEAR') && element.displayInPos.contains('Y')){
          clearStatus = true;
        }
      }
    });
  }
}