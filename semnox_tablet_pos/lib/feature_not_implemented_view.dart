library feature_not_implemented_ui;

import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:product_config_ui/widgets/primaryLargeButton.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class FeatureNotImplementedView extends StatefulWidget {
  final String title;

  const FeatureNotImplementedView(this.title, {super.key});

  @override
  State<StatefulWidget> createState() => _FeatureNotImplementedViewState();
}

class _FeatureNotImplementedViewState extends State<FeatureNotImplementedView> {
  _FeatureNotImplementedViewState();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
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
                  height: SizeConfig.getHeight(342),
                  width: SizeConfig.getWidth(572),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.getHeight(98),
                        child: Center(
                          child: Text(
                            MessagesProvider.get(widget.title.toUpperCase()),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(22)),),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            MessagesProvider.get("Feature not implemented."),
                            style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(18)),
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
                        height: SizeConfig.getHeight(95),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PrimaryLargeButton(
                                text: MessagesProvider.get("OK"),
                                onPressed: () {
                                  Navigator.of(context).pop();
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
