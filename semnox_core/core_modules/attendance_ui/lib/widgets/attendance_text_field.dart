import 'package:attendance_ui/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class AttendanceTextField extends StatelessWidget {
  final String initalValue;
  const AttendanceTextField({
    Key? key,
    required this.initalValue,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return SizedBox(
      height: SizeConfig.getSize(60),
      width: width * 0.4,
      child: TextFormField(
        readOnly: true,
        style: KTextStyle.smallBlackText
            .copyWith(fontSize: SizeConfig.getFontSize(22)),
        initialValue: initalValue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10),
          filled: true,
          fillColor: theme.tableRow1,
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
