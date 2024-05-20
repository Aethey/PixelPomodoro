import 'package:day_puzzle/routes/routes.dart';
import 'package:day_puzzle/state/theme_state.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application.dart';
import 'feature/home/home_page.dart';
import 'feature/setting/sleep_time.dart';

void main() {
  // define route
  final router = FluroRouter();
  Routes.defineRoutes(router);
  Application.router = router;
  // define route over
  runApp(ProviderScope(
      child: MyApp(
    router: router,
  )));
}

class MyApp extends ConsumerWidget {
  final FluroRouter router;
  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: router.generator,
              theme: themeState.themeData,
              title: 'Flutter Demo',
              home: const SleepTimeSetPage());
        });
  }
}
