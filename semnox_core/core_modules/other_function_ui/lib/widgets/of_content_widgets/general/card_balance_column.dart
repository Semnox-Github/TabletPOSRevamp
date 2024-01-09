import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';

class CardBalanceColumn extends StatelessWidget {
  final String title, desc;
  final double? textSize;
  const CardBalanceColumn({super.key, required this.title, required this.desc, this.textSize});

  @override
  Widget build(BuildContext context) {
    late SemnoxTheme _theme;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style:_theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(textSize ?? 16),fontWeight: FontWeight.w400)),
        Text(desc, style:_theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(textSize ?? 16))),
      ],
    );
  }
}
