import 'package:day_puzzle/component/sandglass_painter.dart';
import 'package:flutter/material.dart';

class SandGlassWidget extends StatefulWidget {
  const SandGlassWidget({super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  State<SandGlassWidget> createState() => _SandGlassWidgetState();
}

class _SandGlassWidgetState extends State<SandGlassWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width * 2 / 3 + 20,
      height: widget.height,
      child: CustomPaint(
        painter: SandGlassPainter(width: widget.width * 2 / 3),
      ),
    );
  }
}
