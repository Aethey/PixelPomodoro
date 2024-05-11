import 'package:flutter/material.dart';

class SandGlassPainter extends CustomPainter {
  final double width;
  SandGlassPainter({required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.brown;
    int spacing = 1;
    double pixelSize = width / 20;

    for (int i = 0; i < 30; i++) {
      for (int j = 0; j < 20; j++) {
        double x = j * (pixelSize + spacing);
        double y = i * (pixelSize + spacing);
        canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
