import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:product_config_ui/widgets/secondaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class VipOnlyDialog extends StatefulWidget {
  final Function() onYesTapped;
  final Function() onNoTapped;

  const VipOnlyDialog({
    Key? key,
    required this.onYesTapped,
    required this.onNoTapped,
  }) : super(key: key);

  @override
  State<VipOnlyDialog> createState() => _VipOnlyDialogState();
}

class _VipOnlyDialogState extends State<VipOnlyDialog> {
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
              resizeToAvoidBottomInset: false,
              backgroundColor: theme.transparentColor,
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                ),
                child: SizedBox(
                  height: SizeConfig.getHeight(312),
                  width: SizeConfig.getWidth(572),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.getHeight(98),
                        child: Center(
                          child: Text(
                            MessagesProvider.get("VIP ONLY"),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: theme.heading3?.copyWith(
                              fontSize: SizeConfig.getFontSize(26),
                            ),
                          ),
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
                              "${MessagesProvider.get("Product available only for VIP")}. ${MessagesProvider.get("Do you want to select another card/customer?")}",
                              style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                              textAlign: TextAlign.center,
                              maxLines: 3,
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
                            SecondaryLargeButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.onNoTapped();
                                },
                                text: MessagesProvider.get("NO")),
                            SizedBox(width: SizeConfig.getWidth(10)),
                            PrimaryLargeButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  widget.onYesTapped();
                                },
                                text: MessagesProvider.get("YES"))
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
