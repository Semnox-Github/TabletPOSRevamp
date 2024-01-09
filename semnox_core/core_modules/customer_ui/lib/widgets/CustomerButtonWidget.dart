import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class CustomerButtonWidget extends StatelessWidget {
  VoidCallback? onPress;
  String text;
  String? page;

  CustomerButtonWidget({super.key, this.onPress, required this.text, this.page});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          backgroundColor: page == "accounts" ? Colors.black : theme.button2InnerShadow1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: Text(
          text,
          style: theme.subtitleLight3?.copyWith(color: theme.light1, fontSize: SizeConfig.getFontSize(16)),
          textAlign: TextAlign.center,
          //minFontSize: 12,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
        //Text(text, style: AppStyle.customerButtonText,textAlign: TextAlign.center,)
        );
  }
}
