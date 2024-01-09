import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/app_colors.dart';

import 'utils/size_config.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String? message;
  final VoidCallback? onTapOk;

  const ErrorDialog(
      {super.key, required this.title, this.message, this.onTapOk});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    AppColors.init(context);
    SizeConfig.init(context);
    return AlertDialog(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Text(
          title,
          style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32)),
          textAlign: TextAlign.center,
        ),
      ),
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: _widget(context, theme),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              if (onTapOk != null) {
                onTapOk!();
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
              backgroundColor: AppColors.backGroundGreyLightColor1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
            ),
            child: Text(
              MessagesProvider.get("OK"),
              style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(26), color: Colors.black),
            ),
          ),
        )
      ],
    );
  }

  Widget _widget(BuildContext context, SemnoxTheme theme) {
    return Container(
      color: theme.backGroundColor,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            color: Colors.black26,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50),
            child: Column(
              children: [
                Text(message ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(32), fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}
