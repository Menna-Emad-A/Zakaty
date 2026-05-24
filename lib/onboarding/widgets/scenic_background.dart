import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../onboarding_colors.dart';

enum ScenicVariant { splash, onboarding }

class ScenicBackground extends StatelessWidget {
  const ScenicBackground({
    super.key,
    required this.child,
    this.foreground,
    this.variant = ScenicVariant.onboarding,
  });

  final Widget child;
  final Widget? foreground;
  final ScenicVariant variant;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                OnboardingColors.deepSea,
                Color(0xFF3B6574),
                OnboardingColors.mistBlue,
              ],
              stops: [.04, .53, 1],
            ),
          ),
        ),
        CustomPaint(painter: _SceneryPainter(variant: variant)),
        if (foreground != null) foreground!,
        child,
      ],
    );
  }
}

class _SceneryPainter extends CustomPainter {
  const _SceneryPainter({required this.variant});

  final ScenicVariant variant;

  @override
  void paint(Canvas canvas, Size size) {
    _drawMountains(canvas, size);
    if (variant == ScenicVariant.splash) {
      _drawMoonAndBirds(canvas, size);
    }
    _drawMosque(canvas, size);
  }

  void _drawMountains(Canvas canvas, Size size) {
    final farPath =
        Path()
          ..moveTo(0, size.height * .78)
          ..lineTo(size.width * .18, size.height * .74)
          ..lineTo(size.width * .32, size.height * .79)
          ..lineTo(size.width * .5, size.height * .72)
          ..lineTo(size.width * .7, size.height * .8)
          ..lineTo(size.width, size.height * .74)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
    canvas.drawPath(
      farPath,
      Paint()..color = Colors.white.withValues(alpha: .42),
    );

    final nearPath =
        Path()
          ..moveTo(0, size.height * .86)
          ..lineTo(size.width * .22, size.height * .78)
          ..lineTo(size.width * .43, size.height * .84)
          ..lineTo(size.width * .68, size.height * .76)
          ..lineTo(size.width, size.height * .81)
          ..lineTo(size.width, size.height)
          ..lineTo(0, size.height)
          ..close();
    canvas.drawPath(
      nearPath,
      Paint()..color = const Color(0xFF566E65).withValues(alpha: .44),
    );
  }

  void _drawMoonAndBirds(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width * .26, size.height * .68),
      39,
      Paint()..color = const Color(0xFFFFF6D8),
    );
    canvas.drawCircle(
      Offset(size.width * .32, size.height * .63),
      42,
      Paint()..color = OnboardingColors.mistBlue,
    );

    final birdPaint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4
          ..strokeCap = StrokeCap.round
          ..color = const Color(0xFF556666).withValues(alpha: .55);
    for (final point in [
      Offset(size.width * .2, size.height * .79),
      Offset(size.width * .35, size.height * .75),
      Offset(size.width * .48, size.height * .8),
    ]) {
      final bird =
          Path()
            ..moveTo(point.dx - 6, point.dy)
            ..quadraticBezierTo(point.dx, point.dy - 4, point.dx + 6, point.dy);
      canvas.drawPath(bird, birdPaint);
    }
  }

  void _drawMosque(Canvas canvas, Size size) {
    final baseY = size.height * (variant == ScenicVariant.splash ? .94 : .91);
    final paint =
        Paint()..color = OnboardingColors.silhouette.withValues(alpha: .95);

    canvas.drawRect(
      Rect.fromLTWH(0, baseY, size.width, size.height - baseY),
      paint,
    );

    void dome(double x, double w, double h) {
      final y = baseY - h;
      final path =
          Path()
            ..moveTo(x, baseY)
            ..lineTo(x, y + h * .45)
            ..quadraticBezierTo(x + w / 2, y - h * .25, x + w, y + h * .45)
            ..lineTo(x + w, baseY)
            ..close();
      canvas.drawPath(path, paint);
      canvas.drawLine(
        Offset(x + w / 2, y - 5),
        Offset(x + w / 2, y - 22),
        paint..strokeWidth = 2,
      );
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(x + w / 2 + 6, y - 23),
          width: 16,
          height: 16,
        ),
        math.pi * .55,
        math.pi * 1.1,
        false,
        paint..style = PaintingStyle.stroke,
      );
      paint.style = PaintingStyle.fill;
    }

    void minaret(double x, double h) {
      canvas.drawRect(Rect.fromLTWH(x, baseY - h, 9, h), paint);
      canvas.drawRect(Rect.fromLTWH(x - 5, baseY - h + 18, 19, 7), paint);
      canvas.drawCircle(Offset(x + 4.5, baseY - h - 7), 8, paint);
      canvas.drawLine(
        Offset(x + 4.5, baseY - h - 16),
        Offset(x + 4.5, baseY - h - 31),
        paint..strokeWidth = 2,
      );
    }

    if (variant == ScenicVariant.splash) {
      minaret(size.width * .23, 80);
      minaret(size.width * .52, 104);
      minaret(size.width * .68, 88);
      minaret(size.width * .78, 78);
      dome(size.width * .39, size.width * .24, 85);
      dome(size.width * .02, size.width * .17, 58);
      dome(size.width * .29, size.width * .14, 55);
      dome(size.width * .63, size.width * .13, 52);
      dome(size.width * .82, size.width * .16, 54);
    } else {
      minaret(size.width * .17, 92);
      minaret(size.width * .43, 66);
      minaret(size.width * .48, 92);
      dome(size.width * .02, size.width * .26, 92);
      dome(size.width * .31, size.width * .16, 58);
      dome(size.width * .56, size.width * .22, 70);
    }
  }

  @override
  bool shouldRepaint(covariant _SceneryPainter oldDelegate) {
    return oldDelegate.variant != variant;
  }
}
