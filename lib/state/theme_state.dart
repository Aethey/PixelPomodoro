import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 创建一个主题配置的数据模型
class ThemeState {
  final ThemeData themeData;
  final bool isDarkMode;

  ThemeState({required this.themeData, this.isDarkMode = false});

  ThemeState copyWith({ThemeData? themeData, bool? isDarkMode}) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}

// 创建一个状态提供者
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  return ThemeNotifier();
});

// ThemeNotifier用来处理主题的更改
class ThemeNotifier extends StateNotifier<ThemeState> {
  ThemeNotifier() : super(ThemeState(themeData: ThemeData.light()));

  void toggleTheme(bool isDark) {
    state = state.copyWith(
      isDarkMode: isDark,
      themeData: isDark ? ThemeData.dark() : ThemeData.light(),
    );
  }

  void setCustomColor(Color color) {
    ThemeData newTheme = state.themeData.copyWith(
      primaryColor: color,
    );
    state = state.copyWith(themeData: newTheme);
  }
}
