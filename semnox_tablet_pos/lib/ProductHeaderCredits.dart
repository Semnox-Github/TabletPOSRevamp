import 'package:flutter/material.dart';

class ProductHeaderCredits extends StatelessWidget {
  const ProductHeaderCredits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Credits',
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 2),
        Text(
          '2349',
          style: TextStyle(
              fontSize: 19,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
