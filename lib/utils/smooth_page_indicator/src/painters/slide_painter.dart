import 'package:flutter/material.dart';
import 'package:xinshijieapp/utils/smooth_page_indicator/src/effects/slide_effect.dart';

import 'indicator_painter.dart';

class SlidePainter extends BasicIndicatorPainter {
  final SlideEffect effect;

  SlidePainter({
    required this.effect,
    required int count,
    required double offset,
  }) : super(offset, count, effect);

  @override
  void paint(Canvas canvas, Size size) {
    // paint still dots

    paintStillDots(canvas, size);

    final activeDotPainter = Paint()..color = effect.activeDotColor;
    final dotOffset = offset - offset.toInt();
    // handle dot travel from end to start (for infinite pager support)
    if (offset > count - 1) {
      final startDot = calcPortalTravel(size, effect.dotWidth / 2, dotOffset);
      canvas.drawRRect(startDot, activeDotPainter);

      final endDot = calcPortalTravel(
        size,
        ((count - 1) * distance) + (effect.dotWidth / 2),
        1 - dotOffset,
      );
      canvas.drawRRect(endDot, activeDotPainter);
      return;
    }

    final xPos = offset * distance;
    final yPos = size.height / 2;
    final rRect = RRect.fromLTRBR(
      xPos,
      yPos - effect.dotHeight / 2,
      xPos + effect.dotWidth,
      yPos + effect.dotHeight / 2,
      dotRadius,
    );

    canvas.drawRRect(rRect, activeDotPainter);
  }
}
