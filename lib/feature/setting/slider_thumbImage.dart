import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:flutter/material.dart';

class RectSliderThumbShape extends SliderComponentShape {
  /// Create a slider thumb that draws a Rect.
  const RectSliderThumbShape({
    this.enabledThumbRadius = 10.0,
    this.disabledThumbRadius,
    this.elevation = 1.0,
    this.pressedElevation = 6.0,
  });

  /// The preferred radius of the round thumb shape when the slider is enabled.
  ///
  /// If it is not provided, then the Material Design default of 10 is used.
  final double enabledThumbRadius;

  /// The preferred radius of the round thumb shape when the slider is disabled.
  ///
  /// If no disabledRadius is provided, then it is equal to the
  /// [enabledThumbRadius]
  final double? disabledThumbRadius;
  double get _disabledThumbRadius => disabledThumbRadius ?? enabledThumbRadius;

  /// The resting elevation adds shadow to the unpressed thumb.
  ///
  /// The default is 1.
  ///
  /// Use 0 for no shadow. The higher the value, the larger the shadow. For
  /// example, a value of 12 will create a very large shadow.
  ///
  final double elevation;

  /// The pressed elevation adds shadow to the pressed thumb.
  ///
  /// The default is 6.
  ///
  /// Use 0 for no shadow. The higher the value, the larger the shadow. For
  /// example, a value of 12 will create a very large shadow.
  final double pressedElevation;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(
        isEnabled == true ? enabledThumbRadius : _disabledThumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    assert(context != null);
    assert(center != null);
    assert(enableAnimation != null);
    assert(sliderTheme != null);
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);

    final Canvas canvas = context.canvas;
    final Tween<double> radiusTween = Tween<double>(
      begin: _disabledThumbRadius,
      end: enabledThumbRadius,
    );
    final ColorTween colorTween = ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );

    final Color color = colorTween.evaluate(enableAnimation)!;
    final double radius = radiusTween.evaluate(enableAnimation);

    final Tween<double> elevationTween = Tween<double>(
      begin: elevation,
      end: pressedElevation,
    );

    final double evaluatedElevation =
        elevationTween.evaluate(activationAnimation);
    final Path path = Path()
      ..addArc(
          Rect.fromCenter(
              center: center, width: 2 * radius, height: 2 * radius),
          0,
          math.pi * 2);

    bool paintShadows = true;
    assert(() {
      if (debugDisableShadows) {
        paintShadows = false;
      }
      return true;
    }());

    if (paintShadows) {
      canvas.drawShadow(path, Colors.black, evaluatedElevation, true);
    }

    // Use drawRect instead of drawCircle
    canvas.drawRect(
      Rect.fromCircle(center: center, radius: radius),
      Paint()..color = color,
    );
  }
}
