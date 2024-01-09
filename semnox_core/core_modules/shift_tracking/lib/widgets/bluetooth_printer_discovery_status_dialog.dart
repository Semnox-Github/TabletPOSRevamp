import 'package:widgets_library/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';

class BluetoothPrinterDiscoveryStatusDialog extends StatefulWidget {
  final VoidCallback onOkTapped;
  final String content;

  const BluetoothPrinterDiscoveryStatusDialog({Key? key, required this.onOkTapped, required this.content}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BluetoothPrinterDiscoveryStatusDialog();
}

class _BluetoothPrinterDiscoveryStatusDialog extends State<BluetoothPrinterDiscoveryStatusDialog> {
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
                            (MessagesProvider.get(widget.content)),
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
                          PrimaryLargeButton(
                              text: MessagesProvider.get("OK"),
                              onPressed: () {
                                Navigator.pop(context);
                                widget.onOkTapped();
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