import 'package:flutter/material.dart';
import 'package:login_ui/utils/styles.dart';

extension WidgetExtension on Widget {

  Widget withLoader({required bool isLoading, String? message}) {
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
              color: Colors.white,
              width: 200,
              height: 80,
              child: DefaultTextStyle(
                style: tsS12W500C00,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 16),
                      const CircularProgressIndicator(),
                      const SizedBox(width: 24),
                      Text(message ?? "Loading...", style: tsS12W500C00),
                    ]),
              ),
            ),
          ),
      ],
    );
  }
}

extension StringExtension on String {

}

extension DoubleExtension on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
  String formatToDC() => toStringAsFixed(2);
}