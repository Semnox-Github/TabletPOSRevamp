import 'package:flutter/material.dart';
import 'package:orders_ui/utils/AppStyle.dart';
import 'package:themes_library/themes_library.dart';

extension WidgetExtension on Widget {
  Widget withLoader(SemnoxTheme theme,
      {required bool isLoading, required String message}) {
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
              color: theme.backGroundColor,
              width: 250,
              height: 80,
              child: DefaultTextStyle(
                style: AppStyle.loadingTextStyle
                    .copyWith(color: theme.primaryOpposite),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(width: 16),
                  const CircularProgressIndicator(),
                  const SizedBox(width: 24),
                  Text(message),
                ]),
              ),
            ),
          ),
      ],
    );
  }
}
