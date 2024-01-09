import 'package:widgets_library/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';

class PrintReceiptConfirmationDialog extends StatefulWidget {
  final VoidCallback onConfirmTapped;
  final VoidCallback onCancelTapped;

  const PrintReceiptConfirmationDialog({Key? key, required this.onConfirmTapped, required this.onCancelTapped}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrintReceiptConfirmationDialog();
}

class _PrintReceiptConfirmationDialog extends State<PrintReceiptConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;

    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
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
                          child: Text(
                            (MessagesProvider.get("Please confirm if you want to print the Transaction Receipt")),
                            style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(24)),
                            maxLines: 2,
                            textAlign: TextAlign.center,
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
                                text: MessagesProvider.get("CONFIRM"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.onConfirmTapped();
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
      ),
    );
  }
}