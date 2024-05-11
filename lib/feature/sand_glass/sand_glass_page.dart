import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SandGlassPage extends ConsumerStatefulWidget {
  const SandGlassPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<SandGlassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      height: 1.sh,
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '22:30',
                style: TextStyle(
                  fontFamily: 'PixelFont',
                  fontWeight: FontWeight.bold,
                  fontSize: 64,
                ),
              ),
              // ShaderMask(
              //   shaderCallback: (Rect bounds) {
              //     return LinearGradient(
              //       colors: [Colors.red, Colors.blue],
              //       tileMode: TileMode.mirror,
              //     ).createShader(bounds);
              //   },
              //   child: Image.asset('assets/gifs/PixelHourglass.gif'),
              // ),
              Image.asset(
                'assets/gifs/PixelHourglass.gif',
                color: Colors.blue,
                colorBlendMode: BlendMode.modulate,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(1.0),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.red; // 按下状态时背景色为蓝色
                          } else if (states.contains(MaterialState.disabled)) {
                            return Colors.red; // 禁用状态时背景色为灰色
                          }
                          return Colors.black; // 默认状态背景色为红色
                        }),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // 设置圆角半径
                        )), // 设置阴影大小为0
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/icons/close.png",
                          color: Colors.white,
                          width: 48,
                          height: 48,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
