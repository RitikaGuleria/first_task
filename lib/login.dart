import "package:first_task/dashboardScreen.dart";
import "package:first_task/registerUser.dart";
import "package:first_task/splash_screen.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";


// void main()
// {
//   runApp(LogIn());
// }

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool passwordVisible=true;
  bool isLoading = false;

  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36,18,36,18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sign In",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w300),),
              SizedBox(height: 38,),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextField(
                  controller: usernameController,
                    decoration: InputDecoration(
                      label: Text("Username"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                    ),
              ),),
              SizedBox(height: 18,),
                TextField(
                  controller: passwordController,
                  obscureText: !passwordVisible,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    helperText: "Password must contain special characters- @,#,&",
                    suffixIcon: IconButton(
                      icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off
                      ), onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        },
                        );
                    },
                    ),
                    alignLabelWithHint: false,
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(21))
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
              SizedBox(height: 38,),
              ElevatedButton(onPressed:  isLoading ? null : () async{

                if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                  setState(() {
                    isLoading = true;
                  });

                  //if credentials are correct- succesfully logged in
                  var sharedpef = await SharedPreferences.getInstance();

                  String savedUsername=sharedpef.getString('username') ?? '';
                  String savedPassword=sharedpef.getString('password') ?? '';

                  if(usernameController.text == savedUsername && passwordController.text == savedPassword) {
                    sharedpef.setBool(SplashScreenState.KEYLOGIN, true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()));
                  }else{
                    //incorrect credentials
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Credentials'),duration: Duration(seconds: 2),));
                    setState(() {
                    isLoading = false;
                    });
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Both fields are required to log in..."),duration: Duration(seconds: 2),));

                }

              }, child: isLoading?CircularProgressIndicator():Text("Sign in"),),
              SizedBox(height: 18,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterUser()));
                },child: Text('Do not have an account Register here',style: TextStyle(
                color: Colors.blue,decoration: TextDecoration.underline
              ),),
              )
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
    super.dispose();
  }
}
