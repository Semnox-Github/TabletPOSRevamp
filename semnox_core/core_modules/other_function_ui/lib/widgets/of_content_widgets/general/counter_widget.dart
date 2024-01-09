import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

// ignore: must_be_immutable
class CounterWidget extends StatelessWidget {
  ValueNotifier<int>? count;
  CounterWidget({super.key, this.count});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return NumberPad(
              isZeroRequired: true,
              title: '',
              onOkPressed: (value) {
                count!.value = value;
              },
            );
          },
        );
      },
      child: Container(
        height: height * 0.09,
        width: width * 0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: KColor.borderGrey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (count!.value > 0) {
                  count!.value--;
                }
              },
              child: Padding(
                padding: SizeConfig.isBigDevice()? const EdgeInsets.all(4.0): EdgeInsets.zero,
                child: SizedBox(
                  height: 80,
                  width: SizeConfig.isBigDevice() ? 70: 30,
                  child: Card(
                    color: theme.button1BG1,
                    child: Icon(Icons.remove,size: SizeConfig.isBigDevice()?SizeConfig.getSize(50):SizeConfig.getSize(40)),
                  ),
                ),
              ),
            ),
            ValueListenableBuilder<int>(
              builder: (BuildContext context, value, Widget? child) {
                return Text(
                  '${count!.value}',
                  style: theme.heading2!.copyWith(fontSize: SizeConfig.isBigDevice()?SizeConfig.getFontSize(24):SizeConfig.getFontSize(24)),
                );
              },
              valueListenable: count!,
            ),
            GestureDetector(
              onTap: () {
                count!.value++;
              },
              child: Padding(
                padding: SizeConfig.isBigDevice()? const EdgeInsets.all(4.0): EdgeInsets.zero,
                child: SizedBox(
                  height: 80,
                  width: SizeConfig.isBigDevice() ? 70: 30,
                  child: Card(
                    color: theme.button1BG1,
                    child:  Icon(Icons.add,size: SizeConfig.isBigDevice() ?SizeConfig.getSize(50):SizeConfig.getSize(40)),
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
