import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../entity/color_matrix.dart';

// 定义Notifier
class ColorMatrixNotifier extends StateNotifier<List<ColorMatrixEntity>> {
  ColorMatrixNotifier()
      : super(List.generate(
            18 * 8, (i) => ColorMatrixEntity(colorType: i ~/ 18 % 3)));

  void shiftRowsAndCycleColors() {
    List<ColorMatrixEntity> newMatrix = List<ColorMatrixEntity>.from(state);
    // 把最后一行移动到第一行并更新其颜色
    List<ColorMatrixEntity> lastRow = newMatrix.sublist(newMatrix.length - 18);
    lastRow = lastRow
        .map((e) => ColorMatrixEntity(colorType: (e.colorType + 1) % 3))
        .toList();
    newMatrix.removeRange(newMatrix.length - 18, newMatrix.length);
    newMatrix.insertAll(0, lastRow);

    // 更新状态
    state = newMatrix;
  }
}

// 通过Provider暴露Notifier
final colorMatrixProvider =
    StateNotifierProvider<ColorMatrixNotifier, List<ColorMatrixEntity>>((ref) {
  return ColorMatrixNotifier();
});
