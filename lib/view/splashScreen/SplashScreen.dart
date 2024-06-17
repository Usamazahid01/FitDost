import 'dart:async';
import 'package:fitdost_app/OnBoarding/BordingScreen1.dart';
import 'package:fitdost_app/view/Signup/SignupScreen.dart';
import 'package:fitdost_app/view/home/HomeScreenMain.dart';
import 'package:fitdost_app/view/login/LoginScreen2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// String finalEmail="";
  @override
  void initState() {
    // getValidationData().whenComplete(()async{
    //   Timer(Duration(seconds: 4), () {
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> finalEmail == null ? SignupScreen():HomeScreenMain()));
    //
    //   });
    // });
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen(),));

    });


  }
// Future getValidationData()async{
//   final SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
//   var obtainedEmail =  sharedPreferences.getString("email");
//   setState(() {
//     finalEmail= obtainedEmail!;
//
//
//   });
//   print(finalEmail);
//
// }
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Image.asset('assets/images/Logo/FitDostLogo.png', width: 200,)),
      ),
    );
  }
}