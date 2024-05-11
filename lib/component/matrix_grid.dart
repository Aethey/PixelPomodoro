import 'package:flutter/material.dart';

import '../entity/color_matrix.dart';
import '../style/color_manager.dart';

class MatrixGrid extends StatelessWidget {
  final List<ColorMatrixEntity> colorMatrix;
  final int row;
  final int col;
  const MatrixGrid(
      {super.key,
      required this.colorMatrix,
      required this.row,
      required this.col});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: row, // 每行18个矩形
      ),
      itemCount: col * row, // 总共16行18列
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: ColorManage.colorArray[colorMatrix[index].colorType],
              border: Border.all(color: Colors.black12) // 添加边框以区分每个矩形
              ),
        );
      },
    );
  }
}
