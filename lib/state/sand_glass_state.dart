import 'dart:async';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final sandProvider = StateNotifierProvider<SandNotifier, List<Offset>>((ref) {
  return SandNotifier();
});

class SandNotifier extends StateNotifier<List<Offset>> {
  SandNotifier() : super([]);

  void addSand(Offset offset) {
    state = [...state, offset];
  }

  void clearSand() {
    state = [];
  }

  void moveSand(int index, Offset newPosition) {
    var newState = List<Offset>.from(state);
    newState[index] = newPosition;
    state = newState;
  }
}
