import 'package:flutter/material.dart';
import 'package:semnox_tablet_pos/ProductHeaderView.dart';
import 'package:semnox_tablet_pos/ProductMenu.dart';

class ProductHome extends StatelessWidget {
  const ProductHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
            child: PhysicalModel(
                color: const Color(0xffEDEFF7),
                elevation: 3,
                shadowColor: const Color(0xffBBBCC1),
                borderRadius: BorderRadius.circular(8),
                child: const ProductHeader()),
          ),
          const SizedBox(height: 16),
          const ProductMenu(),
        ],
      ),
    );
  }
}
