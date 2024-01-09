import 'package:flutter/material.dart';

class AttendanceRow extends StatelessWidget {
  final Widget firstColumn;
  final Widget secondColumn;
  const AttendanceRow(
      {Key? key, required this.firstColumn, required this.secondColumn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        firstColumn,
        secondColumn,
      ],
    );
  }
}
