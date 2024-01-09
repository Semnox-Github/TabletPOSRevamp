import 'package:flutter/cupertino.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class SearchItemWidget extends StatelessWidget{

  double _widthFactor;
  String? _text;

  SearchItemWidget(this._widthFactor, this._text);

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
     return
       Flexible(child: FractionallySizedBox(
             widthFactor:_widthFactor ,
             child: Text(_text ?? "",style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(18)), textAlign: TextAlign.center,
               overflow: TextOverflow.ellipsis,)));
  }

}