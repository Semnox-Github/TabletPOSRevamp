import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class RefundTabBar extends StatelessWidget {
  final String tabView;
  final Function()? onDoubleTap;
  final Function()? cardTapFunction;
  final Function()? refundTapFunction;
  const RefundTabBar(
      {super.key,
      this.cardTapFunction,
      this.refundTapFunction,
      this.onDoubleTap,
      required this.tabView});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      child: Container(
        color: theme.backGroundColor,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: refundTapFunction,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: tabView == 'refund'
                          ? theme.button2InnerShadow1
                          : theme.button1BG1),
                  child: Text(
                    MessagesProvider.get('Refund Card'),
                    textAlign: TextAlign.center,
                    style: tabView == 'refund'
                        ? KTextStyle.backBtnText.copyWith(
                        color: theme.light1,
                        fontSize: SizeConfig.getFontSize(22))
                        : KTextStyle.backBtnText.copyWith(
                        color: theme.primaryOpposite,
                        fontSize: SizeConfig.getFontSize(22)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: cardTapFunction,
                onDoubleTap: onDoubleTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: tabView == 'Tap'
                          ? theme.button2InnerShadow1
                          : theme.button1BG1),
                  child: Text(
                    MessagesProvider.get('Cards'),
                    textAlign: TextAlign.center,
                    style: tabView == 'Tap'
                        ? KTextStyle.backBtnText.copyWith(
                        color: theme.light1,
                        fontSize: SizeConfig.getFontSize(22))
                        : KTextStyle.backBtnText.copyWith(
                        color: theme.primaryOpposite,
                        fontSize: SizeConfig.getFontSize(22)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
