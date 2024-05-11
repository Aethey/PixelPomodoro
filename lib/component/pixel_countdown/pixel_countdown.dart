import 'dart:async';

import 'package:flutter/material.dart';

const digitMatrices = [
  [1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1], // 0

  [0, 1, 0, 1, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 1], // 1

  [1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1], // 2

  [1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1], // 3

  [1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1], // 4

  [1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1], // 5

  [1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1], // 6

  [1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1], // 7

  [1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1], // 8

  [1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1], // 9
  [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0], // :
];

class PixelCountdownPanel extends StatefulWidget {
  final double size;
  final int timeLong;
  final Color numberColor;
  const PixelCountdownPanel(
      {super.key,
      required this.size,
      required this.timeLong,
      required this.numberColor});

  @override
  State<StatefulWidget> createState() => PixelCountdownPanelState();
}

class PixelCountdownPanelState extends State<PixelCountdownPanel>
    with AutomaticKeepAliveClientMixin {
  late StreamController<TimeDisplay> _timeController;
  late Timer _timer;
  late int _remainingTime;
  static bool _showColon = true;
  @override
  void initState() {
    super.initState();
    _timeController = StreamController<TimeDisplay>.broadcast();
    _remainingTime = widget.timeLong;
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  void _startTimer() {
    int tickCount = 0; // 添加一个计数器跟踪触发次数
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      // 每次都切换冒号的显示状态
      _showColon = !_showColon;
      _timeController.sink.add(TimeDisplay(
          _formatDuration(Duration(seconds: _remainingTime)), _showColon));

      if (tickCount % 2 == 1) {
        // 每两次触发中的一次减少时间
        if (_remainingTime <= 0) {
          timer.cancel();
          _timeController.close();
        } else {
          _remainingTime -= 1;
        }
      }
      tickCount++; // 增加计数器
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      width: widget.size,
      padding: const EdgeInsets.only(left: 2.0),
      child: StreamBuilder<TimeDisplay>(
        stream: _timeController.stream,
        initialData: TimeDisplay(
            _formatDuration(Duration(seconds: _remainingTime.toInt())), true),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final parts = snapshot.data!.time.split(':');
            bool showColon = snapshot.data!.showColon;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildDigitNumber(
                    int.parse(parts[0][0]), widget.size * 0.9 / 5),
                _buildDigitNumber(
                    int.parse(parts[0][1]), widget.size * 0.9 / 5),
                // showColon ? Text(":") : Text(""),
                _buildDigitPoint(
                    digitMatrices[10], widget.size * 0.9 / 5, showColon),
                _buildDigitNumber(
                    int.parse(parts[1][0]), widget.size * 0.9 / 5),
                _buildDigitNumber(
                    int.parse(parts[1][1]), widget.size * 0.9 / 5),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildDigitNumber(int tens, double width) {
    return SizedBox(
      width: width,
      height: width * 2,
      child: CustomPaint(
        painter: NumbersPainter(
            flatMatrix: digitMatrices[tens],
            width: width,
            numberColor: widget.numberColor),
      ),
    );
  }

  Widget _buildDigitPoint(flatMatrix, width, showColon) {
    return SizedBox(
      width: width,
      height: width * 2,
      child: CustomPaint(
        painter: PointPainter(
            flatMatrix: flatMatrix, showColon: showColon, width: width),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class NumbersPainter extends CustomPainter {
  final List<int> flatMatrix;
  final double spacing;
  final double width;
  final Color numberColor;

  NumbersPainter(
      {required this.flatMatrix,
      this.spacing = 2.0,
      required this.width,
      required this.numberColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = numberColor;
    int numColumns = 3;
    double pixelSize = width / numColumns - spacing;

    for (int i = 0; i < flatMatrix.length / numColumns; i++) {
      for (int j = 0; j < numColumns; j++) {
        int index = i * numColumns + j;
        if (flatMatrix[index] == 1) {
          double x = j * (pixelSize + spacing);
          double y = i * (pixelSize + spacing);
          canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PointPainter extends CustomPainter {
  final double width;
  final bool showColon;
  final double spacing;
  final List<int> flatMatrix;
  PointPainter({
    required this.flatMatrix,
    required this.width,
    required this.showColon,
    this.spacing = 2.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color =
          showColon ? Colors.black.withAlpha(50) : Colors.black.withAlpha(25);

    int numColumns = 3;
    double pixelSize = width / numColumns - spacing;

    for (int i = 0; i < flatMatrix.length / numColumns; i++) {
      for (int j = 0; j < numColumns; j++) {
        int index = i * numColumns + j;
        if (flatMatrix[index] == 1) {
          double x = j * (pixelSize + spacing);
          double y = i * (pixelSize + spacing);
          canvas.drawRect(Rect.fromLTWH(x, y, pixelSize, pixelSize), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TimeDisplay {
  final String time;
  final bool showColon;

  TimeDisplay(this.time, this.showColon);
}
