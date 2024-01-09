import 'package:flutter/material.dart';
import 'package:other_function_ui/widgets/colors.dart';

class SsidBtn extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  const SsidBtn({Key? key, required this.icon, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: KColor.borderGrey, borderRadius: BorderRadius.circular(8)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
