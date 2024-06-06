
import 'package:fitdost_app/common/Colour_extension.dart';
import 'package:fitdost_app/view/home/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController=TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 254.h ),
                width: 310.w,
                height: 46.h,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
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
                height: 46.h,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(

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
                height: 46.h,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
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
                height: 46.h,
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
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
              margin: EdgeInsets.only(top:542.h),

              child: Center(
                child: Text(
                  'By continuing, you agree to our Privacy Policy \n and our Terms of Service.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6F6F6F),
                    fontSize: 11.sp,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w400,
                    height: 0,
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
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(),));
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
              
              child: Container(
                margin: EdgeInsets.only(top: 656.h),
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
