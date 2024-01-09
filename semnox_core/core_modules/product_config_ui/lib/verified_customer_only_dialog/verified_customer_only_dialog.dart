import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../widgets/primaryLargeButton.dart';
import '../widgets/secondaryLargeButton.dart';

class VerifiedCustomerOnlyDialog extends StatefulWidget {
  final String productName;
  final Function() onYesTapped;
  final Function() onNoTapped;

  const VerifiedCustomerOnlyDialog({
    Key? key,
    required this.productName,
    required this.onYesTapped,
    required this.onNoTapped,
  }) : super(key: key);

  @override
  State<VerifiedCustomerOnlyDialog> createState() => _VerifiedCustomerOnlyDialogState();
}

class _VerifiedCustomerOnlyDialogState extends State<VerifiedCustomerOnlyDialog> {
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
                            widget.productName.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(26)),
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
                              "${MessagesProvider.get("Product: &1 is available for Verified Customers only", [
                                    widget.productName
                                  ])}. "
                              "${MessagesProvider.get("Do you want to verify?")}",
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
                              text: MessagesProvider.get("NO"),
                            ),
                            SizedBox(width: SizeConfig.getWidth(10)),
                            PrimaryLargeButton(
                              text: MessagesProvider.get("YES"),
                              onPressed: () {
                                Navigator.pop(context);
                                widget.onYesTapped();
                              },
                            ),
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
