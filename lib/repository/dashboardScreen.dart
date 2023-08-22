import 'package:dio/dio.dart';
import 'package:first_task/repository/APIService&DashboardScreen.dart';
import 'package:first_task/login.dart';
import 'package:first_task/project/routes/app_route_constants.dart';
import 'package:first_task/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var jsonList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    try {
      print('api call');
      var response = await Dio().get('https://reqres.in/api/users?page=2');
      print('api call end');
      if (response.statusCode == 200) {
        print("ritika");
        jsonList = response.data['data'] as List;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('catch block');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Screen'),
      ),
      endDrawer: ElevatedButton(
        onPressed: () async {
          SharedPreferences sharedpref = await SharedPreferences.getInstance();
          sharedpref.setBool(SplashScreenState.KEYLOGIN, false);

          GoRouter.of(context).pushNamed(MyAppRouteConstants.loginRouteName);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LogIn()));
        },
        child: Text("log out"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22)),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.network(
                    jsonList[index]['avatar'],
                    fit: BoxFit.fill,
                    height: 60,
                    width: 60,
                  ),
                ),
                title: Text(jsonList[index]['first_name']),
                subtitle: Text(jsonList[index]['email']),
              ),
            ),
          );
        },
        itemCount: jsonList == null ? 0 : jsonList.length,
      ),
    );
  }
}

