import 'dart:math';

import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double startFraction, endFraction;
  final Color strokeColor;
  late final Paint circlePaint;

  CirclePainter(
      {required this.startFraction,
      required this.endFraction,
      required this.strokeColor}) {
    circlePaint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var rect = const Offset(0.0, 0.0) & size;
    // start : -pi / 2
    // end : pi * 2 * fraction

    canvas.drawArc(
        rect, startFraction, pi * 2 * endFraction, false, circlePaint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.endFraction != endFraction;
  }
}
