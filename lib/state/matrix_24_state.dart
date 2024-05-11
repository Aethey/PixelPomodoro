import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import '../entity/color_matrix.dart';

final matrixProvider = StateProvider<List<ColorMatrixEntity>>((ref) {
  // 初始化矩阵，随机颜色，16行18列
  var random = Random();
  List<ColorMatrixEntity> matrix = List.generate(
      288, (i) => ColorMatrixEntity(colorType: random.nextInt(5)));

  List<ColorMatrixEntity> matrixtrapezoid = List.generate(288, (i) {
    // Define the shape of the trapezoid
    final row = i ~/ 16;
    final col = i % 18;
    if (col >= 2 &&
        col <= 15 &&
        row >= 1 &&
        row <= 14 &&
        col - row >= 1 &&
        col - row <= 12) {
      // Inside the trapezoid, set it to blue
      return ColorMatrixEntity(colorType: 0);
    } else {
      // Outside the trapezoid, set it to green
      return ColorMatrixEntity(colorType: 1);
    }
  });
  return matrixtrapezoid;
});
