import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/common/Colour_extension.dart';
import 'package:fitdost_app/view/Signup/optScreen.dart';
import 'package:fitdost_app/view/home/HomeScreenMain.dart';
import 'package:fitdost_app/view/login/LoginScreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../utils/toast.dart';


class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({Key? key}) : super(key: key);

  @override
  State<SignupScreen2> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen2> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  void _verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+92${_phoneController.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        await _addUserDetails();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenMain()),
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        Utils().toast(e.message ?? "Phone verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationId: verificationId,
              phoneNumber: _phoneController.text,
              displayName: _nameController.text,
              email: _emailController.text,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> _addUserDetails() async {
    final user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': _nameController.text,
        'email': _emailController.text,
        'phoneNumber': _phoneController.text,
        'uid': user.uid,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: 390.w,
              height: 558.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/BackGrounds/LoginSignupBack.png"),
                  fit: BoxFit.values[0],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150.h),
                Container(
                  width: 168.w,
                  height: 93.h,
                  child: Image.asset("assets/images/Logo/FitDostLogoWhite.png"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 350.h),
                Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 226.h),
                  width: 354.w,
                  height: 468.h,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 17.90,
                        offset: Offset(0, 5),
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 254.h),
                      width: 310.w,
                      height: 70.h,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _nameController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter your username.'),
                        ]),
                        decoration: InputDecoration(
                          hintText: "Your Name",
                          suffixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 324.h),
                      width: 310.w,
                      height: 70.h,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _emailController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter your email.'),
                          EmailValidator(errorText: 'Enter a valid email address.'),
                        ]),
                        decoration: InputDecoration(
                          hintText: "Email",
                          suffixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 396.h),
                      width: 310.w,
                      height: 70.h,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _passwordController,
                        obscureText: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Enter your password.'),
                          MinLengthValidator(8, errorText: 'Password must be at least 8 characters long.'),
                          PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{8,}$',
                              errorText: 'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.'),
                        ]),
                        decoration: InputDecoration(
                          hintText: "Password",
                          focusColor: Tcolor.primary1,
                          suffixIcon: Icon(Icons.key),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 467.h),
                      width: 310.w,
                      height: 70.h,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _phoneController,
                        validator: RequiredValidator(errorText: 'Enter your phone number.'),
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          focusColor: Tcolor.primary1,
                          suffixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 550.h),
                    child: Center(
                      child: Text(
                        'By continuing, you agree to our Privacy Policy \n and our Terms of Service.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6F6F6F),
                          fontSize: 11.sp,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w400,
                          height: 1.5.h,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 597.h),
                      width: 177.w,
                      height: 48.h,
                      decoration: ShapeDecoration(
                        color: Color(0xFF00B58D),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 0.50.w, color: Color(0xFF334853)),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _verifyPhoneNumber();
                          }
                        },
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen2(),
                    )),
                    child: Container(
                      margin: EdgeInsets.only(top: 660.h),
                      child: Center(
                        child: Text(
                          'Or Login',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 15.sp,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 750.h),
              child: Center(
                child: Text(
                  'V 1.0',
                  style: TextStyle(
                    color: Color(0xFF4A4852),
                    fontSize: 10.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 800.h),
              child: Center(
                child: Text(
                  '© 2024 FitDost. All rights reserved',
                  style: TextStyle(
                    color: Color(0xFF4A4852),
                    fontSize: 8.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
