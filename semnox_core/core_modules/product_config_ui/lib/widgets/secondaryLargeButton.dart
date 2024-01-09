import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class SecondaryLargeButton extends StatelessWidget {
  const SecondaryLargeButton({Key? key, required this.onPressed, required this.text}) : super(key: key);
  final VoidCallback onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    late SemnoxTheme _theme =  Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all( SizeConfig.getSize(4)),
        tapTargetSize:
        MaterialTapTargetSize.shrinkWrap,
          maximumSize: Size(SizeConfig.getSize(122),SizeConfig.getSize(72)),
          minimumSize:  Size(SizeConfig.getSize(122),SizeConfig.getSize(72)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              SizeConfig.getSize(8)), // <-- Radius
        ),

        backgroundColor: _theme.button1BG1!,
      ),
      onPressed: onPressed,
      child: Text(
        text??'',
        style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
      ),
    );
  }
}
