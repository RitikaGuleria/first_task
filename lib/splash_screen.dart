import 'dart:async';

import 'package:first_task/dashboardScreen.dart';
import 'package:first_task/login.dart';
import 'package:first_task/project/routes/app_route_constants.dart';
import 'package:first_task/registerUser.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = "LOGIN";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: const Center(
          child: Text(
            'Classic',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 34,
                color: Colors.white,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          GoRouter.of(context)
              .pushNamed(MyAppRouteConstants.dashboardRouteName);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
        } else {
          GoRouter.of(context).pushNamed(MyAppRouteConstants.loginRouteName);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
        }
      } else {
        GoRouter.of(context).pushNamed(MyAppRouteConstants.loginRouteName);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
      }
    });
  }
}
