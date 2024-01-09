import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../../colors.dart';

// ignore: must_be_immutable
class CreditWidget extends StatelessWidget {
  ValueNotifier<int>? count;
  CreditWidget({super.key, this.count});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      color: theme.button1BG1,
      elevation: 0,
      child: SizedBox(
        height: height * 0.08,
        width: width * 0.3,
        child: Center(
          child: count == null
              ? Text(
                  '0',
                  style: theme.heading2!.copyWith(fontSize: SizeConfig.getFontSize(30)),
                )
              : ValueListenableBuilder<int>(
                  valueListenable: count!,
                  builder: (context, value, child) {
                    return Text(
                      '${count!.value * 10}',
                      style: theme.heading2!.copyWith(fontSize: SizeConfig.getFontSize(30)),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
