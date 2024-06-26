import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/utils/toast.dart';
import 'package:fitdost_app/view/home/HomeScreenMain.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class VarifyEmailScreen extends StatefulWidget{
  @override
  State<VarifyEmailScreen> createState() => _VarifyEmailScreenState();
}

class _VarifyEmailScreenState extends State<VarifyEmailScreen> {
  bool isEmailVerified=false;
  Timer? timer;
  bool canResendEmail =false;
@override
void initState() {

  super.initState();

  isEmailVerified= FirebaseAuth.instance.currentUser!.emailVerified;
  if(!isEmailVerified) {
    sendVerificationEmail();
    timer=Timer.periodic(
      Duration(seconds: 3),
        (_)=> checkEmailVerified(),
    );


  }
}
@override
void dispose() {
  timer?.cancel();
  super.dispose();
}

Future checkEmailVerified()async {
  await FirebaseAuth.instance.currentUser!.reload();
setState(() {
  isEmailVerified=FirebaseAuth.instance.currentUser!.emailVerified;

});

if(isEmailVerified) timer?.cancel();


}


Future sendVerificationEmail()async {
  try {
    final user=FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    setState(() =>canResendEmail=false    );
    await Future.delayed(Duration(seconds: 5));
    setState(() =>canResendEmail=true    );


  }catch(e){
    Utils().toast(e.toString());
  }



}
  @override
  Widget build(BuildContext context) => isEmailVerified ? HomeScreenMain() : Scaffold(
      appBar: AppBar(
  title: Text("Verify Email"),
        backgroundColor:  const Color(0xFF00B58D),
  ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("A Verification Email has been sent to your Email",style: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        height: 0,

          ),textAlign: TextAlign.center,    ),

          SizedBox(height: 24,),
          ElevatedButton.icon(

            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
              backgroundColor: const Color(0xFF00B58D),
            ),
            icon: Icon(Icons.email,size: 32),
            label: Text(
              "Reset Email",
              style: TextStyle(
                fontSize: 24
              ),

            ),
            onPressed :canResendEmail? sendVerificationEmail: null,


              ),
          SizedBox(height: 8,),
          TextButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size.fromHeight(50),
            ),
            child: Text(
              "Cancel",
              style: TextStyle(
                fontSize: 2,
              ),
            ),
            onPressed: ()=>FirebaseAuth.instance.signOut() ,
             ),


        ],
      ),
    ),




      );


  }