import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
class PrimaryButton2 extends StatefulWidget {
  const PrimaryButton2({Key? key, required this.onPressed, required this.text, required this.isEnabled}) : super(key: key);
  final VoidCallback onPressed;
  final bool isEnabled;
  final String? text;
  @override
  State<PrimaryButton2> createState() => _PrimaryButton2State();
}

class _PrimaryButton2State extends State<PrimaryButton2> {
  @override
  Widget build(BuildContext context) {
    late SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
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
              SizeConfig.getSize(8)),

        ),
        backgroundColor: widget.isEnabled ? theme.button2InnerShadow1 : theme.tableRow1,
      ),
      onPressed:widget.onPressed ,
      child: Text(
        widget.text??'',
        style:
        theme.headingLight5!.copyWith(fontSize:SizeConfig.getFontSize(18),color: widget.isEnabled ? Colors.white : Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
