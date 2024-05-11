import 'dart:async';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../component/matrix_grid.dart';
import '../../state/matrix_scroll_state.dart';

void timerIsolate(ReceivePort receivePort) async {
  SendPort sendPort = receivePort.sendPort;
  Timer.periodic(Duration(milliseconds: 600), (timer) {
    // 发送更新指令到主isolate
    sendPort.send(null);
  });
}

class MatrixScrollGrid extends ConsumerStatefulWidget {
  const MatrixScrollGrid({super.key});

  @override
  _MatrixScrollGridState createState() => _MatrixScrollGridState();
}

class _MatrixScrollGridState extends ConsumerState<MatrixScrollGrid> {
  late Isolate _isolate;
  late ReceivePort _receivePort;

  @override
  void initState() {
    super.initState();
    _receivePort = ReceivePort();
    Isolate.spawn(timerIsolate, _receivePort);
    _receivePort.listen((data) {
      if (mounted) {
        ref.read(colorMatrixProvider.notifier).shiftRowsAndCycleColors();
      }
    });
  }

  @override
  void dispose() {
    _isolate.kill(priority: Isolate.immediate);
    _receivePort.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorMatrix = ref.watch(colorMatrixProvider);
    return MatrixGrid(
      colorMatrix: colorMatrix,
      row: 18,
      col: 8,
    );
  }
}
