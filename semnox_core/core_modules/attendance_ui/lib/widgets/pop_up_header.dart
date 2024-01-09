import 'package:attendance_ui/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class PopUpHeader extends StatelessWidget {
  final VoidCallback onBackClicked;
  const PopUpHeader({super.key, required this.onBackClicked});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
          SizeConfig.getWidth(0),
          SizeConfig.getHeight(0),
          SizeConfig.getWidth(0),
          SizeConfig.getHeight(0)),
      child: Column(
        children: [
          Container(
            height: SizeConfig.getHeight(64),
            decoration: BoxDecoration(
                color: theme.backGroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeConfig.getSize(8)),
                    topLeft: Radius.circular(SizeConfig.getSize(8)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    onBackClicked();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.getWidth(21.0), right: SizeConfig.getWidth(20)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            MessagesProvider.get('RECORD ATTENDANCE'),
                            style: theme.heading2!.copyWith(fontSize:SizeConfig.getFontSize(20)),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: SizeConfig.getSize(2),
            color: theme.dialogFooterInnerShadow,
            height: SizeConfig.getHeight(1),
          ),
        ],
      ),
    );
  }
}
