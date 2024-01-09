import 'package:attendance_ui/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:widgets_library/utils/size_config.dart';

class TextFieldColumn extends StatelessWidget {
  const TextFieldColumn({
    Key? key,
    required this.header,
    required this.widget,
  }) : super(key: key);

  final String header;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header,
            style: KTextStyle.regularBoldTextStyle
                .copyWith(fontSize: SizeConfig.getFontSize(22))),
        const SizedBox(height: 5),
        widget,
      ],
    );
  }
}
