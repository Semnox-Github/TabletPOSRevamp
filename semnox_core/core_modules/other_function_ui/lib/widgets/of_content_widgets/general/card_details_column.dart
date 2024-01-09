import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/text_style.dart';

class CardDetailsColumn extends StatelessWidget {
  final String text1, text2;
  final String? text3;
  final Image? image1, image2, image3;
  const CardDetailsColumn(
      {super.key,
      required this.text1,
      this.text3,
      required this.text2,
      this.image1,
      this.image3,
      this.image2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            image1 ?? const SizedBox.shrink(),
            const SizedBox(width: 5),
            Text(text1, style: KTextStyle.smallBlackText),
          ],
        ),
        text3 == null
            ? const SizedBox.shrink()
            : Row(
                children: [
                  image3 ?? const SizedBox.shrink(),
                  const SizedBox(width: 5),
                  Text(text3 ?? '', style: KTextStyle.smallBlackText),
                ],
              ),
        Row(
          children: [
            image2 ?? const SizedBox.shrink(),
            const SizedBox(width: 5),
            Text(text2, style: KTextStyle.smallBlackText),
          ],
        )
      ],
    );
  }
}
