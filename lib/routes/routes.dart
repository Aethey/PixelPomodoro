import 'package:day_puzzle/feature/home/home_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../app_config.dart';

class Routes {
  static String editPage = AppConfig.homePage;

  static void defineRoutes(FluroRouter router) {
    router.define(editPage, handler: editPageHandler);
  }
}

var editPageHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic>? params) {
  //pageToRedirectTo
  return const HomePage();
});
