import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';

import '../utils/size_config.dart';

class LookupButtonWidget extends StatelessWidget{

  VoidCallback? onPress;
  String text;
  Color? background;
  TextStyle? textStyle;
  int? heightPadding;

  LookupButtonWidget({
    this.onPress,
    required this.text,
    required this.background,
    this.textStyle,
    this.heightPadding});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);

    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          padding: heightPadding != null ? const EdgeInsets.only(top: 8.0,bottom: 8.0) : const EdgeInsets.all(8.0),
          backgroundColor: background,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
        child: Text(text,style: textStyle ?? theme.subtitleLight3?.copyWith(fontSize: SizeConfig.getFontSize(16)),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,));
  }

}