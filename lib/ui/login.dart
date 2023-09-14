import "package:first_task/providers/fetchUserLogin.dart";
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

  // late SharedPreferences loginData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
        centerTitle: true,
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

                        var sharedpef = await SharedPreferences.getInstance();



                        if (email.isNotEmpty && password.isNotEmpty) {
                          var token = await ref.read(fetchUserLoginProvider.notifier).fetchUserLogin(email, password);
                          sharedpef.setString("user_token", token.value.toString());
                          if(!mounted) return;

                          context.pushNamed(MyAppRouteConstants.dashboardRouteName);
                        }
                        else {
                          if(!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Fill both the fields"), duration: Duration(seconds: 2),));
                        }
                      },
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Sign in"),
              ),
              const SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(MyAppRouteConstants.registerRouteName);
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
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
    ref.invalidate(fetchUserLoginProvider);
  }
}
