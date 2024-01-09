import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class BreadCrumbItemUI extends StatelessWidget {
  final String _label;

  const BreadCrumbItemUI(this._label, {super.key});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
      ),
      shadowColor: CupertinoColors.label,
      color: theme.button1BG1,
      child: Padding(
        padding:  EdgeInsets.all(SizeConfig.getSize(6)),
        child: Text(
          _label,
          style:  TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.getSize(22)),
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
