import 'package:flutter/material.dart';
import 'package:orders_ui/Screens/TableSeatLoayoutScreen.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class OrderButton extends StatelessWidget {
  String title;
  VoidCallback? onPress;

  OrderButton({super.key, required this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          backgroundColor:
          title == "MERGE" && !(actionButtonsAccessControl!.contains('MERGE')) ?
          Colors.grey.shade300 :
          title == "UNMERGE" && !(actionButtonsAccessControl!.contains('UNMERGE')) ?
          Colors.grey.shade300 :
          title == "MOVE" && !(actionButtonsAccessControl!.contains('MOVE')) ?
          Colors.grey.shade300 :
          title == "DETAILS" && !(actionButtonsAccessControl!.contains('DETAILS')) ?
          Colors.grey.shade300 :
          title == "RESERVE" && !(actionButtonsAccessControl!.contains('RESERVE')) ?
          Colors.grey.shade300 :
          title == "BLOCK" && !(actionButtonsAccessControl!.contains('BLOCK')) ?
          Colors.grey.shade300 :
          title == "CLEAR" && !(actionButtonsAccessControl!.contains('CLEAR')) ?
          Colors.grey.shade300
              : theme.secondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        child: Text(
          title,
          style: theme.descriptionLight1?.copyWith(fontSize: SizeConfig.getFontSize(16)),
          textAlign: TextAlign.center,
        ));
  }
}
