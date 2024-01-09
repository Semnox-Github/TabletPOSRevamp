import 'package:customer_ui/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/widgets/OrderButton.dart';
import 'package:themes_library/themes_library.dart';

class OrderActionMode extends StatefulWidget{


  final VoidCallback? onActionMode;
  final VoidCallback? onMove;
  final VoidCallback? onNewOrder;
  final VoidCallback? onCancel;
  bool actionMode = true;
  bool isEnableNewOrderButton;

  OrderActionMode({this.onActionMode, this.onMove, this.onNewOrder,required this.actionMode,this.onCancel,this.isEnableNewOrderButton = false});

  @override
  State<OrderActionMode> createState() => _OrderActionModeState();
}

class _OrderActionModeState extends State<OrderActionMode> {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OrderButton(title: (!widget.actionMode) ?  MessagesProvider.get("order\n mode").toUpperCase() : MessagesProvider.get("action\n mode").toUpperCase() ,
          onPress: widget.onActionMode,),
        const SizedBox(width: 8.0,),
        widget.isEnableNewOrderButton ? activeNewOrderButton(widget.onNewOrder) : OrderButton(title: MessagesProvider.get("New Order").toUpperCase(), onPress: null ),
        const SizedBox(width: 8.0,),
        moveButton(widget.onMove,widget.actionMode),
        // OrderButton(title: MessagesProvider.get("Move").toUpperCase(), onPress: !widget.actionMode ? null : widget.onMove,),
        const SizedBox(width: 8.0,),
        Visibility(
          visible: widget.onCancel != null,
           child: OrderButton(title: MessagesProvider.get("Cancel").toUpperCase(), onPress: widget.onCancel,)),
      ],
    );
  }

  Widget activeNewOrderButton(VoidCallback? onNewOrder){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            backgroundColor:theme.secondaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))
        ),
      child:  Text(
          MessagesProvider.get("New Order").toUpperCase(),
          style: theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(16)),
          textAlign: TextAlign.center,
        ),
      onPressed: onNewOrder,
    );
  }

  Widget moveButton(VoidCallback? onpress,bool isActive){
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          backgroundColor:isActive?theme.secondaryColor : Colors.grey.shade300,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0))
      ),
      child:  Text(
        MessagesProvider.get("MOVE").toUpperCase(),
        style: theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(16)),
        textAlign: TextAlign.center,
      ),
      onPressed: isActive? onpress : null,
    );
  }

}