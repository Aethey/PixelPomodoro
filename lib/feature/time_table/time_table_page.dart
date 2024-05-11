import 'package:day_puzzle/feature/time_table/staggered_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../style/color_manager.dart';

class TimeTablePage extends ConsumerStatefulWidget {
  const TimeTablePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<TimeTablePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManage.timeTableStart,
      body: Center(),
    );
  }
}
