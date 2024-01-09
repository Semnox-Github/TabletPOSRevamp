import 'package:flutter/material.dart';

bool isOpen = false;

showLoaderDialog(BuildContext context, [String? message]) {
  AlertDialog alert = AlertDialog(
    content: Row(children: [
      const SizedBox(width: 8),
      const CircularProgressIndicator(),
      const SizedBox(width: 24),
      Text(message ?? "Loading..."),
    ]),
  );
  isOpen = true;
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return WillPopScope(
          onWillPop: () async => false,
          child: alert);
    },
  ).then((value) => isOpen = false);
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
