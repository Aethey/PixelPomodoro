import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../component/pixel_countdown/pixel_countdown.dart';
import '../../component/pixel_number/pixel_number.dart';
import '../../component/sandglass_widget.dart';
import '../sand_glass_list/pixel_number_image.dart';
import 'common.dart';

class StaggeredPage extends StatelessWidget {
  const StaggeredPage({
    Key? key,
  }) : super(key: key);

  static const tiles = [
    GridTile(5, 3),
    GridTile(5, 2),
    GridTile(2, 2),
    GridTile(3, 2),
  ];
  static const timerArray = [
    [9, 0, 0],
    [6, 0, 2],
    [2, 5, 2],
    [4, 5, 1],
  ];

  static const colorArray = [
    Color(0xFFBED7DC),
    Color(0xFFBFD4FF),
    Color(0xFFB4D4FF),
    Color(0xFFE5DDC5),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 1.sh * 2 / 7,
          width: 1.sw,
          child: Image.asset(
            'assets/images/daypart1.webp', fit: BoxFit.fitWidth,
            // color: Colors.blue,
            // colorBlendMode: BlendMode.modulate,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(4.0),
          child: TextButton(
            style: TextButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero))),
            onPressed: () {},
            child: const PixelCountdownPanel(
              size: 150,
              timeLong: 1200,
              numberColor: Colors.white,
            ),
          ),
        ),
        SandGlassWidget(
          width: 1.sw,
          height: 1.sh / 2,
        )
      ],
    );
  }
}

class GridTile {
  const GridTile(this.crossAxisCount, this.mainAxisCount);
  final int crossAxisCount;
  final int mainAxisCount;
}
