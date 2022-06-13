import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furrl_ui_challenge/constants.dart';

class CirC extends StatelessWidget {
  const CirC({Key? key, this.d}) : super(key: key);
  final double? d;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(d!, d!),
      painter: CircPainter(),
    );
  }
}

class CircPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = blue30;
    var _height = size.height;
    var _width = size.width;
    canvas.drawArc(
        Rect.fromCenter(
          width: _width,
          height: _height,
          center: Offset(_height / 2, _width),
        ),
        pi,
        pi,
        false,
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
