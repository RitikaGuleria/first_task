import 'package:first_task/project/routes/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRouter.router.routeInformationParser,
      routerDelegate: MyAppRouter.router.routerDelegate,
      routeInformationProvider: MyAppRouter.router.routeInformationProvider,
    );
  }
}
