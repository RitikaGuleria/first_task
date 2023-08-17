import 'package:first_task/login.dart';
import 'package:first_task/registerUser.dart';
import 'package:first_task/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
