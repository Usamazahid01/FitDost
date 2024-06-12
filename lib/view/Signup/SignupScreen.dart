

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/common/Colour_extension.dart';
import 'package:fitdost_app/view/home/HomeScreenMain.dart';
import 'package:fitdost_app/view/login/LoginScreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../utils/toast.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordController = TextEditingController();

  Future addUserDetails( String displayName,String email  ) async
  {
    await FirebaseFirestore.instance.collection('users').add({
      'displayName': displayName,
      'email':email,
      'uid': _auth.currentUser!.uid,

    });
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
                    image: AssetImage(
                        "assets/images/BackGrounds/LoginSignupBack.png"),
                    fit: BoxFit.values[0],
                  )
              ),
            ),


            Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 150.h,),
                Container(
                    width: 168.w,
                    height:93.h ,

                    child:
                    Image.asset("assets/images/Logo/FitDostLogoWhite.png")

                )

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 350.h,),
                Text("Sign Up",style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),)
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
                      )
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
                    margin: EdgeInsets.only(top: 254.h ),
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

                        border: OutlineInputBorder(

                        ),

                      ),
                    ),

                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 324.h ),
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
                      //   errorStyle:TextStyle(
                      //   fontSize: 2.sp, // Smaller font size
                      //   height: 0, // No top margin
                      //   color: Colors.red, // Error text color
                      // ),

                        hintText: "Email",
                        suffixIcon: Icon(Icons.email),

                        border: OutlineInputBorder(


                        ),

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
                        MinLengthValidator(8,
                            errorText: 'Password must be at least 8 characters long.'),
                        PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{8,}$',
                            errorText:
                            'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.'),
                      ]),

                      decoration: InputDecoration(
                        hintText: "password",
                        focusColor: Tcolor.primary1,
                        suffixIcon: Icon(Icons.key),

                        border: OutlineInputBorder(



                        ),

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
                      controller: _confirmPasswordController,
                      obscureText: true,
                      validator: MultiValidator([

                        RequiredValidator(errorText: 'Enter your password.'),
                        MinLengthValidator(8,
                            errorText: 'Password must be at least 8 characters long.'),
                        PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{8,}$',
                            errorText:
                            'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.'),
                      ]),
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        focusColor: Tcolor.primary1,
                        suffixIcon: Icon(Icons.key),

                        border: OutlineInputBorder(



                        ),

                      ),
                    ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:550.h),

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
                      onTap: () async {
                        if (_formKey.currentState?.validate() ?? false) {
      if (_passwordController.text == _confirmPasswordController.text) {
        try {
          UserCredential userCredential= await _auth.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );
          FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.email).set({
                          "Username": _nameController.text.trim(),
                        "email":_emailController.text.trim(),
                        });
          //
          // addUserDetails(
          //   _nameController.text.trim(),
          //   _emailController.text.trim(),
          // );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreenMain()),
          );
        } catch (error) {
          Utils().toast(error.toString());
        }
      } else {
        Utils().toast("Passwords do not match");
      }
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
                  onTap:() => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>  LoginScreen2(),

                  )),


                  child: Container(
                    margin: EdgeInsets.only(top: 660.h),
                    child: Center(
                      child: Text(
                        'Or  Login',
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
            )),
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