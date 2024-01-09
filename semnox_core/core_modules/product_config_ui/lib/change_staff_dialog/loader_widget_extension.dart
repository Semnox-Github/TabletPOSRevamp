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
        fontSize: SizeConfig.getFontSize(20),
        fontWeight: FontWeight.w500);
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          this,
          if (isLoading)
            Opacity(
              opacity: 0.8,
              child: ModalBarrier(dismissible: false, color: theme.cartItemCardInnerShadow1),
            ),
          if (isLoading)
            Center(
              child: Container(
                width: SizeConfig.getWidth(600),
                height: SizeConfig.getHeight(100),
                decoration: BoxDecoration(
                    color: theme.cartItemCardBG,
                    borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(4)))),
                child: DefaultTextStyle(
                  style: textStyle,
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    SizedBox(width: SizeConfig.getWidth(16)),
                    CircularProgressIndicator(
                      strokeWidth: SizeConfig.getSize(4),
                    ),
                    SizedBox(width: SizeConfig.getWidth(24)),
                    Text(message ?? MessagesProvider.get("Loading..."), style: textStyle),
                  ]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}