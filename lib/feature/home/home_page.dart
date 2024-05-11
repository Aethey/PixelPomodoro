import 'package:day_puzzle/feature/home/matrix_scroll_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../component/flip_box_navigation_bar/flip_box_navigation_bar.dart';
import '../../state/matrix_24_state.dart';
import '../../style/color_manager.dart';
import '../../style/custom/custom_icon.dart';
import '../profile/profile_page.dart';
import '../sand_glass/sand_glass_page.dart';
import '../sand_glass_list/sand_glass_list_page.dart';
import '../time_table/time_table_page.dart';
import 'matrix_24_grid.dart';

final tabIndexProvider = StateProvider<int>((ref) => 0);
final bgIndexProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  PageController _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    // _pageViewController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade100,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Consumer(builder: (context, ref, child) {
      final currentTabIndex = ref.watch(tabIndexProvider);
      final bgColorIndex = ref.watch(bgIndexProvider);
      return Container(
        color: ColorManage.colorArray[bgColorIndex],
        child: SafeArea(
          child: FlipBoxNavigationBar(
              currentIndex: currentTabIndex,
              verticalPadding: 20.0,
              items: <FlipBoxNavigationBarItem>[
                FlipBoxNavigationBarItem(
                  name: 'Timer',
                  selectedIcon: Icons.computer,
                  unselectedIcon: Icons.computer_outlined,
                  selectedBackgroundColor: ColorManage.sandGlassStart,
                  unselectedBackgroundColor: ColorManage.sandGlassUn,
                ),
                FlipBoxNavigationBarItem(
                  name: 'Table',
                  selectedIcon: CustomIcon.mixing_table_blank,
                  unselectedIcon: CustomIcon.mixing_table,
                  selectedBackgroundColor: ColorManage.timeTableStart,
                  unselectedBackgroundColor: ColorManage.timeTableUn,
                ),
                FlipBoxNavigationBarItem(
                  name: 'Profile',
                  selectedIcon: CustomIcon.users_blank,
                  unselectedIcon: CustomIcon.users,
                  selectedBackgroundColor: ColorManage.profileStart,
                  unselectedBackgroundColor: ColorManage.profileUn,
                ),
              ],
              onTap: (index) {
                _updateIndex(index);
              }),
        ),
      );
    });
  }

  _updateIndex(index) {
    ref.read(tabIndexProvider.notifier).state = index;
    ref.read(bgIndexProvider.notifier).state = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  Widget _buildBody() {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _pageViewController,
      onPageChanged: (int index) {
        // ref.read(tabIndexProvider.state).state = index;
      },
      children: const [
        // PixelCountdownPanel(),
        SandGlassListPage(),
        TimeTablePage(),
        ProfilePage(),
      ],
    );
  }
}
