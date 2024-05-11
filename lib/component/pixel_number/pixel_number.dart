import 'package:flutter/material.dart';

class PixelNumber extends StatelessWidget {
  const PixelNumber(
      {super.key,
      required this.number,
      required this.width,
      required this.height});
  final int number;
  final double width;
  final double height;

  // 定义数字像素矩阵
  static const digitMatrices = [
    [1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1], // 0

    [0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1], // 1

    [1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1], // 2

    [1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1], // 3

    [1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1], // 4

    [1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1], // 5

    [1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1], // 6

    [1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1], // 7

    [1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1], // 8

    [1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1], // 9
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      width: width,
      height: height,
      child: Center(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 15,
          itemBuilder: (context, index) {
            final isLit = digitMatrices[number][index] == 1;
            return Container(
              margin: const EdgeInsets.all(0.5),
              color: isLit ? Colors.black : Colors.transparent,
            );
          },
        ),
      ),
    );
  }
}
