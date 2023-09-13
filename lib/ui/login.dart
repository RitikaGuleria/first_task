import "package:first_task/providers/dashboard.dart";
import "package:first_task/providers/fetchUserLogin.dart";
import 'package:first_task/ui/login_state.dart';
import "package:first_task/project/routes/app_route_constants.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:shared_preferences/shared_preferences.dart";

class LogIn extends ConsumerStatefulWidget {
  const LogIn({super.key});

  @override
  ConsumerState createState() => _LogInState();
}

class _LogInState extends ConsumerState<LogIn> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisible = false;
  bool isLoading = false;

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerstate = ref.read(loginStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36, 18, 36, 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 38,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: const Text("Username"),
                    hintText: "ex- eve.holt@reqres.in",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                controller: passwordController,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                    hintText: "ex- cityslicka",
                    labelText: "Password",
                    helperText:
                        "Password must contain special characters- @,#,&",
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        // setState(() {
                        //   passwordVisible = !passwordVisible;
                        // },
                        // );
                        ref
                            .watch(loginStateNotifierProvider.notifier)
                            .togglePasswordVisibility();
                      },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21))),
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 38,
              ),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        var email = usernameController.text;
                        var password = passwordController.text;

                        // if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                        // setState(() {
                        //   isLoading = true;
                        // });

                        ref
                            .watch(loginStateNotifierProvider.notifier)
                            .setLoading(isLoading = true);

                        //if credentials are correct- succesfully logged in
                        var sharedpef = await SharedPreferences.getInstance();
                        //
                        // String savedUsername=sharedpef.getString('username') ?? '';
                        // String savedPassword=sharedpef.getString('password') ?? '';

                        var token = await ref
                            .watch(fetchUserLoginProvider.notifier)
                            .fetchUserLogin(email, password);

                        // if(usernameController.text == savedUsername && passwordController.text == savedPassword) {

                        sharedpef.setString("user_token", token.value.toString());
                        // sharedpef.setBool(SplashScreenState.KEYLOGIN, true);

                        GoRouter.of(context).pushNamed(MyAppRouteConstants.dashboardRouteName);
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));

                        // }else{
                        //   //incorrect credentials
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials'),duration: Duration(seconds: 2),));
                        //   // setState(() {
                        //   // isLoading = false;
                        //   // });
                        //   ref.watch(loginStateNotifierProvider.notifier).setLoading(isLoading=false);
                        // }
                      }
                // else{
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Both fields are required to log in..."),duration: Duration(seconds: 2),));
                //
                // }

                // }
                ,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Sign in"),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context)
                      .pushNamed(MyAppRouteConstants.registerRouteName);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterUser()));
                },
                child: const Text(
                  'Do not have an account? Register here',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
