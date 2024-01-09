library feature_not_implemented_ui;

import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';

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
    return AlertDialog(
      title: Text(widget.title,style: TextStyle(color: theme.secondaryColor),),
      titleTextStyle:
      TextStyle(fontWeight: FontWeight.bold, color:  theme.secondaryColor, fontSize: 18),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.button2BG1,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
            child: Text(MessagesProvider.get("OK"))),
      ],
      content: Text(
        MessagesProvider.get("Feature not implemented."),
        style:  TextStyle(fontWeight: FontWeight.normal, color:  theme.secondaryColor, fontSize: 14),
      ),
    );
  }
}
