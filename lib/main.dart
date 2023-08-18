import 'package:first_task/login.dart';
import 'package:first_task/project/routes/app_route_config.dart';
import 'package:first_task/registerUser.dart';
import 'package:first_task/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp( ProviderScope(child: MyApp(),));
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp.router(
      // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: MyAppRouter().router.routeInformationParser,
      routerDelegate: MyAppRouter().router.routerDelegate,
    );
  }
}
