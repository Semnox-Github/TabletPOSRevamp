import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_config_ui/AppStyle.dart';

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
                style: AppStyle.loaderTextStyle,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 16),
                      const CircularProgressIndicator(),
                      const SizedBox(width: 24),
                      Text(message ?? "Loading...", style: AppStyle.loaderTextStyle),
                    ]),
              ),
            ),
          ),
      ],
    );
  }
}