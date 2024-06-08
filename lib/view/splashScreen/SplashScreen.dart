import 'dart:async';
import 'package:fitdost_app/OnBoarding/BordingScreen1.dart';
import 'package:fitdost_app/view/Signup/SignupScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen(),));

    });
  }
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(child: Image.asset('assets/images/Logo/FitDostLogo.png', width: 200,)),
      ),
    );
  }
}