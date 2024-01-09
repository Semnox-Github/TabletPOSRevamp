import 'package:flutter/cupertino.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';


class LookupHeaderTextWidget extends StatelessWidget{
  double _widthFactor;
  double heighFactor;
  String? _text;


  LookupHeaderTextWidget(this._widthFactor, this._text, {super.key, required this.heighFactor});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Flexible(child: FractionallySizedBox(
          widthFactor:_widthFactor ,
          child: Text(_text ?? "",style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20)), textAlign: TextAlign.center,
             overflow: TextOverflow.ellipsis,)));
  }

}