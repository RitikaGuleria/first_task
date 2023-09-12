import 'package:first_task/ui/login.dart';
import 'package:first_task/ui/login_state.dart';
import 'package:first_task/project/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterUser extends ConsumerStatefulWidget {
  const RegisterUser({super.key});

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends ConsumerState<RegisterUser> {

  final emailController= TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool passwordVisible=false;

  @override
  Widget build(BuildContext context) {

    final providerstate=ref.watch(loginStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Register User"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36,12,36,18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Register a user",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w300),),
              const SizedBox(height: 38,),
              TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: const Text("username"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                  ),
                  keyboardType: TextInputType.text,
                ),
              const SizedBox(height: 18,),
               TextField(controller: emailController,
                  decoration: InputDecoration(
                    label: const Text("email"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                  ),
                  keyboardType: TextInputType.text,
                ),
              const SizedBox(height: 18,),
              TextField(controller: passwordController,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    helperText: "Password must contain special characters- @,#,&",
                  suffixIcon: IconButton(icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      // setState(() {
                      //   passwordVisible = !passwordVisible;
                      // },);
                      ref.watch(loginStateNotifierProvider.notifier).togglePasswordVisibility();
                    },),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                ),),

              const SizedBox(height: 38,),
              ElevatedButton(onPressed: () async{

                if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
                  //save user credentials into shared prefernce
                  var sharedpref= await SharedPreferences.getInstance();
                  sharedpref.setString('username', usernameController.text);
                  sharedpref.setString('password', passwordController.text);
                  sharedpref.setString('email', emailController.text);

                  GoRouter.of(context).pushNamed(MyAppRouteConstants.loginRouteName);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => LogIn()),
                  // );


                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill all the fields to register..."),duration: Duration(seconds:2),));
                }
              }, child: const Text("Register"))
            ],
          ),
        ),
      ),
    );

  }
  @override
  void dispose(){
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
