import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

showLoaderDialog(BuildContext context, [String? message]) {
  final theme = Theme.of(context).extension<SemnoxTheme>()!;
  AlertDialog alert = AlertDialog(
    content: Row(children: [
      const SizedBox(width: 8),
      const CircularProgressIndicator(),
      const SizedBox(width: 24),
      Text(message ?? "Loading..."),
    ]),
  );
  final isShowing = ModalRoute.of(context)?.isCurrent != true;
  if(!isShowing) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
            child: alert);
      },
    );
  }
}

hideLoaderDialog(BuildContext context) {
  Navigator.pop(context);
}

showLoaderErrorDialog(BuildContext context, [String? message]) {
  AlertDialog alert = AlertDialog(
    content: Row(children: [
      const SizedBox(width: 8),
      const CircularProgressIndicator(
        color: Colors.redAccent,
      ),
      const SizedBox(width: 24),
      Text(
        message ?? "Loading...",
        style: const TextStyle(
          color: Colors.red,
        ),
      ),
    ]),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
