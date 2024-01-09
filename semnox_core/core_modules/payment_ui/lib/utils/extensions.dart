import 'package:flutter/material.dart';
import 'package:payment_ui/utils/styles.dart';
import 'package:themes_library/themes_library.dart';

extension WidgetExtension on Widget {
  Widget withLoader(
      {required bool isLoading, String? message, required SemnoxTheme theme}) {
    return Stack(
      children: [
        this,
        if (isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (isLoading)
          Center(
            child: Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                  color: theme.backGroundColor,
                  borderRadius: BorderRadius.circular(6)),
              child: DefaultTextStyle(
                style: tsS16W50016.copyWith(color: theme.primaryOpposite),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(width: 28),
                  const CircularProgressIndicator(),
                  const SizedBox(width: 28),
                  Text(message ?? "Loading..."),
                ]),
              ),
            ),
          ),
      ],
    );
  }
}

extension StringExtension on String {
  String replaceSpace() => replaceAll("", "\u{200B}");
}

extension DoubleExtension on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
  String formatToDC() => toStringAsFixed(2);
}
