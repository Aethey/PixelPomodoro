import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../component/matrix_grid.dart';
import '../../state/matrix_24_state.dart';

class Matrix24Grid extends ConsumerWidget {
  const Matrix24Grid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorMatrix = ref.watch(matrixProvider);
    return MatrixGrid(
      colorMatrix: colorMatrix,
      row: 18,
      col: 16,
    );
  }
}
