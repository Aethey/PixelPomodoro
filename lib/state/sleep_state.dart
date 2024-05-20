import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SleepTimeState {
  final int sleepTimeHours;
  final int sleepTimeMinutes;
  final int wakeTimeHours;
  final int wakeTimeMinutes;

  SleepTimeState({
    required this.sleepTimeHours,
    required this.sleepTimeMinutes,
    required this.wakeTimeHours,
    required this.wakeTimeMinutes,
  });

  SleepTimeState copyWith({
    int? sleepTimeHours,
    int? sleepTimeMinutes,
    int? wakeTimeHours,
    int? wakeTimeMinutes,
  }) {
    return SleepTimeState(
      sleepTimeHours: sleepTimeHours ?? this.sleepTimeHours,
      sleepTimeMinutes: sleepTimeMinutes ?? this.sleepTimeMinutes,
      wakeTimeHours: wakeTimeHours ?? this.wakeTimeHours,
      wakeTimeMinutes: wakeTimeMinutes ?? this.wakeTimeMinutes,
    );
  }
}

final sleepTimeProvider =
    StateNotifierProvider<SleepTimeNotifier, SleepTimeState>((ref) {
  return SleepTimeNotifier();
});

class SleepTimeNotifier extends StateNotifier<SleepTimeState> {
  SleepTimeNotifier()
      : super(SleepTimeState(
          sleepTimeHours: 22,
          sleepTimeMinutes: 0,
          wakeTimeHours: 7,
          wakeTimeMinutes: 0,
        ));

  void getSleepTIme() {
    // 计算入睡时间和起床时间的总分钟数
    int sleepTimeInMinutes = state.sleepTimeHours * 60 + state.sleepTimeMinutes;
    int wakeTimeInMinutes = state.wakeTimeHours * 60 + state.wakeTimeMinutes;

    // 如果起床时间在入睡时间之前，说明跨越了午夜，需要调整起床时间
    if (wakeTimeInMinutes < sleepTimeInMinutes) {
      wakeTimeInMinutes += 24 * 60;
    }

    // 计算总的睡眠时间分钟数
    int totalSleepTimeInMinutes = wakeTimeInMinutes - sleepTimeInMinutes;

    // 将总的睡眠时间分钟数转换为小时和分钟
    int totalSleepHours = totalSleepTimeInMinutes ~/ 60;
    int totalSleepMinutes = totalSleepTimeInMinutes % 60;

    if (kDebugMode) {
      print(
          'Total sleep time: $totalSleepHours hours and $totalSleepMinutes minutes');
    }
  }

  void updateWheel(int type, int value) {
    if (type == 11) {
      state = state.copyWith(
        sleepTimeHours: value,
      );
    }
    if (type == 12) {
      state = state.copyWith(
        sleepTimeMinutes: value,
      );
    }
    if (type == 21) {
      state = state.copyWith(
        wakeTimeHours: value,
      );
    }
    if (type == 22) {
      state = state.copyWith(
        wakeTimeMinutes: value,
      );
    }
  }

  void updateWheel2(int type) {
    if (type == 11) {
      state = state.copyWith(
        sleepTimeHours: state.sleepTimeHours + 1,
      );
    }
    if (type == 12) {
      state = state.copyWith(
        sleepTimeMinutes: state.sleepTimeMinutes + 1,
      );
    }
    if (type == 21) {
      state = state.copyWith(
        wakeTimeHours: state.wakeTimeHours + 1,
      );
    }
    if (type == 21) {
      state = state.copyWith(
        wakeTimeMinutes: state.wakeTimeMinutes + 1,
      );
    }
    if (type == -11) {
      state = state.copyWith(
        sleepTimeHours: state.sleepTimeHours - 1,
      );
    }
    if (type == -12) {
      state = state.copyWith(
        sleepTimeMinutes: state.sleepTimeMinutes - 1,
      );
    }
    if (type == -21) {
      state = state.copyWith(
        wakeTimeHours: state.wakeTimeHours - 1,
      );
    }
    if (type == -21) {
      state = state.copyWith(
        wakeTimeMinutes: state.wakeTimeMinutes - 1,
      );
    }
  }
}
