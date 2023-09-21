import 'package:first_task/project/routes/app_route_config.dart';
import 'package:first_task/ui/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp(),),);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final goRouter = ref.watch(BottomNav().goRouter);

     return MaterialApp.router(
      // home: SplashScreen(),
      //  routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      routeInformationParser: goRouter.routeInformationParser,
      routerDelegate: goRouter.routerDelegate,
      routeInformationProvider: goRouter.routeInformationProvider,
    );
  }
}
