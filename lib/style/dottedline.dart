import 'package:flutter/material.dart';
import 'package:serviceprovder/style/style.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = headingClr // Change the line color as needed
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double dashWidth = 5; // Adjust the length of each dash
    const double dashSpace = 5; // Adjust the space between dashes

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
