import 'package:first_task/ui/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottomNavigationBar.dart';

class ScreenA extends ConsumerWidget {

  const ScreenA({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.watch(BottomNav().goRouter);

    return  const DashboardScreen();
  }

}