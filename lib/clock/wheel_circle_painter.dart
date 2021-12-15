import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class WheelCircle extends CustomPainter {
  double wheelSize;
  double longNeedleHeight;
  double shortNeedleHeight;
  double radius = 0;
  BuildContext context;

  WheelCircle(
      {required this.wheelSize,
      required this.longNeedleHeight,
      required this.shortNeedleHeight,
      required this.context}) {
    radius = wheelSize / 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    for (int i = 0; i < 60; i++) {
      double minute = 360 / 60 * i;
      paint.color = (i % 5 == 0) ? Color(0xff65D1BA) : Colors.grey;
      paint.strokeWidth = (i % 5 == 0) ? 4 : 1;

      double distance = (i % 5 == 0) ? longNeedleHeight : shortNeedleHeight;

      double x1 = radius * cos(vector.radians(minute));
      double y1 = radius * sin(vector.radians(minute));
      final p1 = Offset(x1, y1);

      double x2 = (radius - distance) * cos(vector.radians(minute));
      double y2 = (radius - distance) * sin(vector.radians(minute));
      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
