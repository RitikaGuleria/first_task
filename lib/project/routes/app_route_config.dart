import 'package:first_task/repository/APIService&DashboardScreen.dart';
import 'package:first_task/repository/dashboardScreen.dart';
import 'package:first_task/login.dart';
import 'package:first_task/project/routes/app_route_constants.dart';
import 'package:first_task/registerUser.dart';
import 'package:first_task/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.splashRouteName,
        path: MyAppRouteConstants.splashRouteName,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.loginRouteName,
        path: '/login',
        pageBuilder: (context, state) {
          return MaterialPage(child: LogIn());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.registerRouteName,
        path: '/registerUser',
        pageBuilder: (context, state) {
          return MaterialPage(child: RegisterUser());
        },
      ),
      GoRoute(
        name: MyAppRouteConstants.dashboardRouteName,
        path: MyAppRouteConstants.dashboardRouteName,
        builder: (context, state) {
          return  APIService();
        },
      )
    ],
  );
}
