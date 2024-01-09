import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/of_content_widgets/master_card_widgets/ssid_btn.dart';
import 'package:other_function_ui/widgets/text_style.dart';

class SsidCounterWidget extends StatelessWidget {
  const SsidCounterWidget({
    Key? key,
    required this.selectCard,
    required this.ssidnumber,
  }) : super(key: key);

  final ValueNotifier<int> selectCard;
  final ValueNotifier<int> ssidnumber;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectCard,
      builder: (context, value, child) {
        return value == 5
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('SSID', style: KTextStyle.regularBoldTextStyle),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(color: KColor.borderGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SsidBtn(
                          icon: Icons.add,
                          onTap: () => ssidnumber.value++,
                        ),
                        ValueListenableBuilder(
                          valueListenable: ssidnumber,
                          builder: (context, value, child) {
                            return Text('$value');
                          },
                        ),
                        SsidBtn(
                          icon: Icons.remove,
                          onTap: () => ssidnumber.value--,
                        )
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
