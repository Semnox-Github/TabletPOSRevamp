import 'package:flutter/cupertino.dart';

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, size.height/2);
    // path.lineTo(size.width / 2, -size.height);
    // path.lineTo(size.width, size.height);
    path.lineTo(0 , size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomTriangleClipper oldClipper) => false;
}