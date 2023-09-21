import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bottomNavigationBar.dart';

class ScreenC extends ConsumerWidget {

  const ScreenC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.watch(BottomNav().goRouter);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen C'),centerTitle: true,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}