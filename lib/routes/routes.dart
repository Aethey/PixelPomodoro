import 'package:pixel_pomodoro/feature/home/home_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../app_config.dart';
import '../feature/setting/sleep_time.dart';
import '../feature/setting/wake_time.dart';

class Routes {
  static String editPage = AppConfig.homePage;
  static String wakeSetPage = AppConfig.wakeTimeSetPage;
  static String sleepSetPage = AppConfig.sleepTimeSetPage;

  static void defineRoutes(FluroRouter router) {
    router.define(editPage, handler: editPageHandler);
    router.define(sleepSetPage, handler: sleepSetPageHandler);
    router.define(wakeSetPage, handler: wakeSetPageHandler);
  }
}

var editPageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic>? params) {
  //pageToRedirectTo
  return const HomePage();
});

var sleepSetPageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic>? params) {
  //pageToRedirectTo
  return const SleepTimeSetPage();
});

var wakeSetPageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic>? params) {
  //pageToRedirectTo
  return const WakeTimeSetPage();
});
