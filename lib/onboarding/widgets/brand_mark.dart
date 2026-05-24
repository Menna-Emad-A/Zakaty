import 'dart:math' as math;

import 'package:flutter/material.dart';

class BrandMark extends StatelessWidget {
  const BrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      height: 142,
      child: CustomPaint(painter: _BrandMarkPainter()),
    );
  }
}

class _BrandMarkPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final shield =
        Path()
          ..moveTo(size.width * .5, 5)
          ..cubicTo(size.width * .28, 20, size.width * .12, 22, 10, 24)
          ..lineTo(10, size.height * .62)
          ..cubicTo(
            17,
            size.height * .82,
            34,
            size.height * .93,
            size.width * .5,
            size.height - 8,
          )
          ..cubicTo(
            size.width - 34,
            size.height * .93,
            size.width - 17,
            size.height * .82,
            size.width - 10,
            size.height * .62,
          )
          ..lineTo(size.width - 10, 24)
          ..cubicTo(
            size.width * .88,
            22,
            size.width * .72,
            20,
            size.width * .5,
            5,
          )
          ..close();

    canvas.drawPath(
      shield.shift(const Offset(0, 5)),
      Paint()
        ..color = Colors.black.withValues(alpha: .5)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
    );

    canvas.drawPath(
      shield,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF657E87), Color(0xFF182B34)],
        ).createShader(Offset.zero & size),
    );

    canvas.drawPath(
      shield,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4
        ..color = const Color(0xFFD5B88D),
    );

    canvas.drawCircle(
      Offset(size.width * .5, size.height * .48),
      34,
      Paint()
        ..color = const Color(0xFFFFE6AA).withValues(alpha: .55)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16),
    );

    final heart =
        Path()
          ..moveTo(size.width * .5, size.height * .45)
          ..cubicTo(
            size.width * .36,
            size.height * .32,
            size.width * .24,
            size.height * .42,
            size.width * .34,
            size.height * .54,
          )
          ..cubicTo(
            size.width * .42,
            size.height * .63,
            size.width * .5,
            size.height * .68,
            size.width * .5,
            size.height * .68,
          )
          ..cubicTo(
            size.width * .5,
            size.height * .68,
            size.width * .58,
            size.height * .63,
            size.width * .66,
            size.height * .54,
          )
          ..cubicTo(
            size.width * .76,
            size.height * .42,
            size.width * .64,
            size.height * .32,
            size.width * .5,
            size.height * .45,
          )
          ..close();
    canvas.drawPath(heart, Paint()..color = const Color(0xFFFFE8B8));

    final handPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4
          ..strokeCap = StrokeCap.round
          ..color = const Color(0xFFFFE7B5);
    canvas.drawArc(
      Rect.fromLTWH(size.width * .17, size.height * .37, 45, 52),
      -math.pi * .08,
      math.pi * .72,
      false,
      handPaint,
    );
    canvas.drawArc(
      Rect.fromLTWH(size.width * .48, size.height * .37, 45, 52),
      math.pi * .36,
      math.pi * .72,
      false,
      handPaint,
    );

    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Zakaty',
        style: TextStyle(
          color: Color(0xFFFFE8C7),
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'serif',
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(
      canvas,
      Offset((size.width - textPainter.width) / 2, size.height * .66),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
