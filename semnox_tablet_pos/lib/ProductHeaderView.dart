import 'package:flutter/material.dart';
import 'package:semnox_tablet_pos/ProductHeaderCredits.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
      child: Container(
        height: 130,
        color: Color(0xffEDEFF7),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, bottom: 0, right: 0, top: 21),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Labeeba Al Amer',
                    style: TextStyle(
                        fontSize: 26,
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 11),
                  Row(
                    children: [
                      Image.asset(
                        'assets/Offers Icon 24@3x.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        '546554',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 40),
                      Image.asset(
                        'assets/Offers Icon 24@3x.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        '23-07-2020',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 40),
                      Image.asset(
                        'assets/Offers Icon 24@3x.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'VIP',
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: 'RobotoCondensed',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, bottom: 0, right: 16, top: 0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        ProductHeaderCredits(),
                        ProductHeaderCredits(),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        ProductHeaderCredits(),
                        ProductHeaderCredits(),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        ProductHeaderCredits(),
                        ProductHeaderCredits(),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        ProductHeaderCredits(),
                        ProductHeaderCredits(),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        ProductHeaderCredits(),
                        ProductHeaderCredits(),
                      ],
                    ),
                    SizedBox(width: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
