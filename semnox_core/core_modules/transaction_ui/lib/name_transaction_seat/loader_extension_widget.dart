import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

extension LoaderWidgetExtension on Widget {
  Widget withLoader({required bool isLoading, String? message, required SemnoxTheme theme}) {
    final textStyle = GoogleFonts.robotoCondensed(
        color: theme.secondaryColor,
        fontSize: SizeConfig.getFontSize(16),
        fontWeight: FontWeight.w500);
    return Stack(
      children: [
        this,
        if (isLoading)
          Opacity(
            opacity: 0.3,
            child: ModalBarrier(dismissible: false, color: theme.primaryColor),
          ),
        if (isLoading)
          Center(
            child: Container(
              width: SizeConfig.getWidth(450),
              height: SizeConfig.getHeight(80),
              decoration: BoxDecoration(
                  color: theme.cartItemCardBG,
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(4)))),
              child: DefaultTextStyle(
                style: textStyle,
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(width: SizeConfig.getWidth(16)),
                  const CircularProgressIndicator(),
                  SizedBox(width: SizeConfig.getWidth(24)),
                  Text(message ?? MessagesProvider.get("Loading..."), style: textStyle),
                ]),
              ),
            ),
          ),
      ],
    );
  }
}