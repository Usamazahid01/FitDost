import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/view/login/LoginScreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../utils/toast.dart';
import '../home/HomeScreenMain.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  final String displayName;
  final String email;

  const OtpScreen({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
    required this.displayName,
    required this.email,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _verifyOtp() async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: _otpController.text.trim(),
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      await _addUserDetails();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenMain()),
      );
    } catch (e) {
      Utils().toast(e.toString());
    }
  }

  Future<void> _addUserDetails() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'displayName': widget.displayName,
        'email': widget.email,
        'phoneNumber': widget.phoneNumber,
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
                  "Verify OTP",
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
                      margin: EdgeInsets.only(top: 324.h),
                      width: 310.w,
                      height: 70.h,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _otpController,
                        validator: RequiredValidator(errorText: 'Enter the OTP.'),
                        decoration: InputDecoration(
                          hintText: "OTP",
                          suffixIcon: Icon(Icons.security),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 450.h),
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
                      margin: EdgeInsets.only(top: 497.h),
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
                            _verifyOtp();
                          }
                        },
                        child: Center(
                          child: Text(
                            'Verify OTP',
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
                      margin: EdgeInsets.only(top: 560.h),
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
              margin: EdgeInsets.only(top: 650.h),
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
              margin: EdgeInsets.only(top: 700.h),
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
