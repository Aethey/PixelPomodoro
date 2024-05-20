import 'package:day_puzzle/feature/setting/time_wheel.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_config.dart';
import '../../application.dart';

class SleepTimeSetPage extends StatelessWidget {
  const SleepTimeSetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5479D6),
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
            'assets/gifs/MoonPiskel.gif',
            // color: Colors.blue,
            colorBlendMode: BlendMode.modulate,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.green,
                child: TimeWheel(
                  type: 1,
                ),
                height: 200,
                width: 1.sw / 2,
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: IconButton(
                  icon: Icon(Icons.keyboard_double_arrow_right_outlined),
                  onPressed: () {
                    Application.router.navigateTo(
                        context, AppConfig.wakeTimeSetPage,
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
