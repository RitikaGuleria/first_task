//configurating Go Router with Material App

import 'dart:js';

import 'package:first_task/dashboardScreen.dart';
import 'package:first_task/login.dart';
import 'package:first_task/project/routes/app_route_constants.dart';
import 'package:first_task/registerUser.dart';
import 'package:first_task/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter
{
  GoRouter router = GoRouter(
    routes: [
      GoRoute(name: MyAppRouteConstants.splashRouteName,path: '/',pageBuilder: (context,state){
        return MaterialPage(child: SplashScreen());
      },),
      GoRoute(name: MyAppRouteConstants.loginRouteName,path: '/login',pageBuilder: (context,state){
        return MaterialPage(child: LogIn());
      },),
      GoRoute(name: MyAppRouteConstants.registerRouteName,path: '/registerUser',pageBuilder: (context,state){
        return MaterialPage(child: RegisterUser());
      },),
      GoRoute(name: MyAppRouteConstants.dashboardRouteName,path: '/dashboard',pageBuilder: (context,state){
        return MaterialPage(child: DashboardScreen());
      })
    ]
  );
}