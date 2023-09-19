import 'package:first_task/providers/fetchUserLogin.dart';
import 'package:first_task/ui/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:first_task/ui/login.dart';
import 'package:first_task/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterUser extends ConsumerStatefulWidget {
  const RegisterUser({super.key});

  @override
  ConsumerState createState() => _RegisterUserState();
}

class _RegisterUserState extends ConsumerState<RegisterUser> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register User"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36, 12, 36, 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Register a user",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 38,
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  label: const Text("username"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  label: const Text("email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)),
                ),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                controller: passwordController,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  helperText: "Password must contain special characters- @,#,&",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21)),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              ElevatedButton(
                  onPressed: () async {
                    // var username = usernameController.text;
                    var email = emailController.text;
                    var password = passwordController.text;

                    //save user credentials into shared prefernce
                    var sharedpref = await SharedPreferences.getInstance();
                    var token = await ref
                        .read(fetchUserLoginProvider.notifier)
                        .fetchUserRegister(email, password);
                    sharedpref.setString(
                        "register_token", token.value.toString());
                    // Navigator.of(context).pop();
                    if(!mounted) return;
                    // context.pushNamed(MyAppRouteConstants.loginRouteName);
                    BottomNav.goRouter.pushNamed(BottomNav.registerationPath);
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    ref.invalidate(fetchUserLoginProvider);
  }
}
