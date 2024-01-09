import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class PrimaryMediumButton extends StatelessWidget {
  const PrimaryMediumButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
  final VoidCallback onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    late SemnoxTheme _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(SizeConfig.getWidth(4)),
        tapTargetSize:
        MaterialTapTargetSize.shrinkWrap,
        maximumSize: Size(SizeConfig.getSize(130),SizeConfig.getSize(75)),
        minimumSize:  Size(SizeConfig.getSize(130),SizeConfig.getSize(75)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              SizeConfig.getSize(8)), // <-- Radius
        ),
        backgroundColor:  _theme.button2InnerShadow1,
      ),
      onPressed: onPressed,
      child: Text(
        text??'',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style:  _theme.headingLight5!.copyWith(fontSize:SizeConfig.getFontSize(20),color: Colors.white),
      ),
    );
  }
}
