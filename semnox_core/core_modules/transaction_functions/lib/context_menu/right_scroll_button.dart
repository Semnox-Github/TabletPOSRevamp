import 'package:flutter/material.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class RightScrollButton extends StatelessWidget {
  const RightScrollButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          padding: EdgeInsets.all(SizeConfig.getSize(2)),
          width: SizeConfig.getWidth(120),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: theme.sideNavBackground,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(4.5)),
          ),
          margin: EdgeInsets.only(
            left: SizeConfig.getWidth(2),
            right: SizeConfig.getWidth(2),
          ),
          child: Center(
              child: Image.asset(
                'assets/ic_double_right_arrow.png',
                width: SizeConfig.getWidth(30),
                height: SizeConfig.getHeight(30),
          )),
        ));
  }
}
