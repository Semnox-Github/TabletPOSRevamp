import 'package:widgets_library/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';

class NoPrintersDialog extends StatefulWidget {
  final VoidCallback onRescanTapped;
  final VoidCallback onCancelTapped;
  final String? content;

  const NoPrintersDialog({Key? key, required this.onRescanTapped, required this.onCancelTapped, required this.content})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NoPrintersDialog();
}

class _NoPrintersDialog extends State<NoPrintersDialog> {
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              widget.content != null
                                  ? "Error : ${widget.content}"
                                  : "Unable to perform the bluetooth receipt printing at the moment.",
                              style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(24)),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              (MessagesProvider.get("Would you like to Re-scan for the Bluetooth Printers ? ")),
                              style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(22)),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ],
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SecondaryLargeButton(
                              text: MessagesProvider.get("CANCEL"),
                              onPressed: () {
                                Navigator.pop(context);
                                widget.onCancelTapped();
                              }),
                          SizedBox(
                            width: SizeConfig.getWidth(16),
                          ),
                          PrimaryLargeButton(
                              text: MessagesProvider.get("RESCAN"),
                              onPressed: () {
                                Navigator.pop(context);
                                widget.onRescanTapped();
                              })
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
