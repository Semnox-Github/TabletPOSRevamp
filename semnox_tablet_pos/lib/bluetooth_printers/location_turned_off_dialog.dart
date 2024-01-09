import 'package:widgets_library/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';

class LocationTurnedOffDialog extends StatefulWidget {
  final VoidCallback onTurnOnTapped;
  final VoidCallback onCancelTapped;

  const LocationTurnedOffDialog({Key? key, required this.onTurnOnTapped, required this.onCancelTapped}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LocationTurnedOffDialog();
}

class _LocationTurnedOffDialog extends State<LocationTurnedOffDialog> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;

    return Material(
      color: theme.transparentColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: theme.transparentColor,
            resizeToAvoidBottomInset: false,
            body: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
              ),
              child: SizedBox(
                height: SizeConfig.getHeight(252),
                width: SizeConfig.getWidth(432),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: SizeConfig.getWidth(40), right: SizeConfig.getWidth(40)),
                          child: Text(
                            (MessagesProvider.get("Unable to search for the Bluetooth Printers, as Location is turned off")),
                            style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(24)),
                            maxLines: 3,
                            textAlign: TextAlign.center,
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
                      height: SizeConfig.getHeight(100),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          /*SecondaryLargeButton(
                              text: MessagesProvider.get("CANCEL"),
                              onPressed: () {
                                Navigator.pop(context);
                                widget.onCancelTapped();
                              }),
                          SizedBox(
                            width: SizeConfig.getWidth(16),
                          ),*/
                          PrimaryLargeButton(
                              text: MessagesProvider.get("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                                widget.onCancelTapped();
                              }),
                          SizedBox(
                            width: SizeConfig.getWidth(40),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}