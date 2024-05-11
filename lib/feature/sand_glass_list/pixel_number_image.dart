import 'package:flutter/material.dart';

class PixelNumberImage extends StatelessWidget {
  const PixelNumberImage(
      {super.key,
      required this.number,
      required this.width,
      required this.height});
  final int number;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/pixel_number_w_0${number}.png',
        width: width,
        height: height,
        color: Colors.blue,
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}
