import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class ContentColumn extends StatelessWidget {
  final String contentTitle;
  final Widget contentWidget;
  const ContentColumn(
      {super.key, required this.contentTitle, required this.contentWidget});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contentTitle,
          style: theme.heading3?.copyWith(fontSize: SizeConfig.getFontSize(30)),
        ),
        const SizedBox(height: 8),
        contentWidget
      ],
    );
  }
}
