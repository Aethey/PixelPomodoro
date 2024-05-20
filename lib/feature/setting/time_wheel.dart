import 'dart:ui' as ui;

import 'package:pixel_pomodoro/feature/setting/slider_thumbImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../component/wheel_picker/wheel_picker_controller.dart';
import '../../component/wheel_picker/wheel_picker_style.dart';
import '../../state/sleep_state.dart';

class TimeWheel extends ConsumerWidget {
  final int type;
  const TimeWheel({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SleepTimeState state = ref.watch(sleepTimeProvider);
    late final hoursWheel = WheelPickerController(
      itemCount: 24,
      initialIndex: type == 1 ? state.sleepTimeHours : state.wakeTimeHours,
    );
    late final minutesWheel = WheelPickerController(
      itemCount: 60,
      initialIndex: type == 1 ? state.sleepTimeMinutes : state.wakeTimeMinutes,
      mounts: [hoursWheel],
    );

    const textStyle = TextStyle(
        fontFamily: 'PixelFont',
        fontWeight: FontWeight.bold,
        fontSize: 36,
        height: 1.5);
    final wheelStyle = WheelPickerStyle(
      size: 200,
      itemExtent: textStyle.fontSize! * textStyle.height!, // Text height
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );
    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WheelPicker(
              builder: itemBuilder,
              controller: hoursWheel,
              looping: true,
              style: wheelStyle,
              selectedIndexColor: Colors.redAccent,
              onIndexChanged: (index) {},
            ),
            const Text(":", style: textStyle),
            WheelPicker(
              builder: itemBuilder,
              controller: minutesWheel,
              style: wheelStyle,
              enableTap: true,
              selectedIndexColor: Colors.redAccent,
              onIndexChanged: (index) {},
            )
          ],
        ),
      ],
    );
  }
}
