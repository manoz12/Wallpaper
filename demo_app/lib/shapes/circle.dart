import 'package:flutter/material.dart';

class Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.black;
    canvas.drawRect(Rect.fromLTWH(20, 40, 80, 80), paint);
    canvas.drawOval(
      Rect.fromLTWH(size.width - 220, 40, 80, 80),
      paint,
    );
    canvas.drawRect(Rect.fromLTWH(260, 40, 80, 80), paint);
    canvas.drawOval(
      Rect.fromLTWH(size.width - 220, 240, 80, 80),
      paint,
    );
    canvas.drawRect(Rect.fromLTWH(260, 240, 80, 80), paint);
    canvas.drawOval(
      Rect.fromLTWH(size.width - 340, 440, 80, 80),
      paint,
    );
    canvas.drawRect(Rect.fromLTWH(130, 440, 80, 80), paint);
    canvas.drawOval(
      Rect.fromLTWH(size.width - 100, 440, 80, 80),
      paint,
    );
    canvas.drawRect(Rect.fromLTWH(10, 240, 80, 80), paint);
//    canvas.drawDRRect(outer, inner, paint)
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
