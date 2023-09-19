import 'package:first_task/ui/dashboard_screen.dart';
import 'package:first_task/ui/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenA extends StatelessWidget {

  const ScreenA({Key? key}) : super(key: key);

  // final String detailsPath;
  // final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return  const DashboardScreen();
  }

}