import 'package:first_task/login.dart';
import 'package:first_task/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatelessWidget {
   DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard Screen'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME",style: TextStyle(fontSize: 36),),
            ElevatedButton(onPressed: () async{
              SharedPreferences sharedpref= await SharedPreferences.getInstance();
              sharedpref.setBool(SplashScreenState.KEYLOGIN,false);

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));

            }, child: Text("log out"))
          ],
        ),
      ),
    );
  }
}
