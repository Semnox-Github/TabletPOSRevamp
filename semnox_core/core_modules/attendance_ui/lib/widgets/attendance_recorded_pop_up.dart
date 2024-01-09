import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class AttendanceRecordedPopUp extends StatelessWidget {
  final String user;
  final Function() onOkTapped;
  const AttendanceRecordedPopUp({super.key, required this.user, required this.onOkTapped});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: theme.transparentColor,
      body: Center(
        child: Container(
          height: SizeConfig.getHeight(312),
          width: SizeConfig.getWidth(572),
          decoration: BoxDecoration(
            color: theme.backGroundColor,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.getHeight(98),
                child: Center(
                  child: Text(
                    MessagesProvider.get("ATTENDANCE"),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(26)),),
                ),
              ),
              Divider(
                thickness: SizeConfig.getSize(1),
                color: theme.dialogFooterInnerShadow,
                height: SizeConfig.getHeight(1),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: SizeConfig.getWidth(30), right: SizeConfig.getWidth(30)),
                  child: Center(
                    child: Text(
                      "Attendance Recorded for $user",
                      style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(24)),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: SizeConfig.getSize(1),
                color: theme.dialogFooterInnerShadow,
                height: SizeConfig.getHeight(1),
              ),
              SizedBox(
                height: SizeConfig.getHeight(98),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryLargeButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        // Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        onOkTapped();
                      },
                      text: MessagesProvider.get("OK"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
