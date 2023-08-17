import 'package:first_task/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

  final emailController= TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  bool passwordVisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register User"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36,12,36,18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Register a user",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w300),),
              SizedBox(height: 38,),
              TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    label: Text("username"),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                  ),
                  keyboardType: TextInputType.text,
                ),
              SizedBox(height: 18,),
               TextField(controller: emailController,
                  decoration: InputDecoration(
                    label: Text("email"),border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                  ),
                  keyboardType: TextInputType.text,
                ),
              SizedBox(height: 18,),
              TextField(controller: passwordController,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    helperText: "Password must contain special characters- @,#,&",
                  suffixIcon: IconButton(icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      },);
                    },),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
                ),),

              SizedBox(height: 38,),
              ElevatedButton(onPressed: () async{

                if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
                  //save user credentials into shared prefernce
                  var sharedpref= await SharedPreferences.getInstance();
                  sharedpref.setString('username', usernameController.text);
                  sharedpref.setString('password', passwordController.text);
                  sharedpref.setString('email', emailController.text);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LogIn()),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields to register..."),duration: Duration(seconds:2),));
                }
              }, child: Text("Register"))
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
