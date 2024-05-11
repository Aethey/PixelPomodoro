import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../style/color_manager.dart';
import '../time_table/staggered_page.dart';

class SandGlassListPage extends ConsumerStatefulWidget {
  const SandGlassListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<SandGlassListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManage.sandGlassStart,
      body: StaggeredPage(),
    );
  }
}
