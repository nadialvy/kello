import 'dart:math' as math;

import 'package:flutter/material.dart';

class DashedBox extends StatelessWidget {
  const DashedBox({
    super.key,
    required this.child,
    this.shape = BoxShape.rectangle,
    this.borderRadius = 12,
    this.color = const Color(0xFFF1C5C9),
    this.strokeWidth = 1.4,
    this.dashLength = 6,
    this.gapLength = 4,
    this.backgroundColor,
  });

  final Widget child;
  final BoxShape shape;
  final double borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    Widget content = child;
    if (backgroundColor != null) {
      content = DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: shape,
          borderRadius:
              shape == BoxShape.rectangle ? BorderRadius.circular(borderRadius) : null,
        ),
        child: content,
      );
    }
    return CustomPaint(
      painter: _DashedBorderPainter(
        shape: shape,
        borderRadius: borderRadius,
        color: color,
        strokeWidth: strokeWidth,
        dashLength: dashLength,
        gapLength: gapLength,
      ),
      child: content,
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({
    required this.shape,
    required this.borderRadius,
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
  });

  final BoxShape shape;
  final double borderRadius;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final inset = strokeWidth / 2;
    final path = Path();
    if (shape == BoxShape.circle) {
      final radius = math.min(size.width, size.height) / 2 - inset;
      path.addOval(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius,
        ),
      );
    } else {
      path.addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            inset,
            inset,
            size.width - strokeWidth,
            size.height - strokeWidth,
          ),
          Radius.circular(borderRadius),
        ),
      );
    }

    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = math.min(distance + dashLength, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) =>
      old.color != color ||
      old.borderRadius != borderRadius ||
      old.shape != shape ||
      old.strokeWidth != strokeWidth ||
      old.dashLength != dashLength ||
      old.gapLength != gapLength;
}
