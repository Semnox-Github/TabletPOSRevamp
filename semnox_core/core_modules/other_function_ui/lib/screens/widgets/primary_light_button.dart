import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class PrimaryLightButton extends StatelessWidget {
  const PrimaryLightButton({Key? key, required this.onPressed, required this.title}) : super(key: key);
  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme  _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);

    return Padding(
      padding: EdgeInsets.all(SizeConfig.getWidth(4)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.fromLTRB(SizeConfig.getWidth(8), SizeConfig.getWidth(4), SizeConfig.getWidth(8), SizeConfig.getWidth(4)),
            tapTargetSize:
            MaterialTapTargetSize.shrinkWrap,
            maximumSize: Size(SizeConfig.getSize(110),SizeConfig.getSize(52)),
            minimumSize:  Size(SizeConfig.getSize(110),SizeConfig.getSize(52)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  SizeConfig.getSize(8)), // <-- Radius
            ),
            backgroundColor: _theme.button1BG1,
            disabledBackgroundColor: KColor.primaryBtnColor,
            foregroundColor:  KColor.primaryBtnColor,
          ),
          onPressed: onPressed, child: Text(title, style: _theme.subtitle3!.copyWith(fontSize:SizeConfig.getFontSize(16)),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,)),
    );
  }
}
