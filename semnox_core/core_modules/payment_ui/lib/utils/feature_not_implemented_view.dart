library feature_not_implemented_ui;

import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';

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
    return AlertDialog(
      title: Text(widget.title),
      titleTextStyle:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
            child: Text(MessagesProvider.get("OK"))),
      ],
      content: Text(
        MessagesProvider.get("Feature not implemented."),
        style: const TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 14),
      ),
    );
  }
}
