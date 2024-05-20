import 'package:pixel_pomodoro/feature/setting/time_wheel.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_config.dart';
import '../../application.dart';
import '../../component/pixel_number/pixel_number.dart';

class WakeTimeSetPage extends StatelessWidget {
  const WakeTimeSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF54D6D6),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return SizedBox(
      height: 1.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            'assets/gifs/SunType2Piskel.gif',
            // color: Colors.blue,
            colorBlendMode: BlendMode.modulate,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                // color: Colors.green,
                height: 200,
                width: 1.sw / 2,
                // color: Colors.green,
                child: const TimeWheel(
                  type: 0,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  icon: const Icon(Icons.keyboard_double_arrow_left_outlined),
                  onPressed: () {
                    Application.router.pop(context);
                  },
                  iconSize: 48,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  icon: const Icon(Icons.keyboard_double_arrow_right_outlined),
                  onPressed: () {
                    Application.router.navigateTo(context, AppConfig.homePage,
                        transition: TransitionType.fadeIn);
                  },
                  iconSize: 48,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
