
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/common/Colour_extension.dart';
import 'package:fitdost_app/utils/toast.dart';
import 'package:fitdost_app/view/Signup/SignupScreen.dart';
import 'package:fitdost_app/view/home/HomeScreen.dart';
import 'package:fitdost_app/view/home/HomeScreenMain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';



class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  State<LoginScreen2> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                Text("Login",style: TextStyle(
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
                  height: 428.h,
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
                   margin: EdgeInsets.only(top: 328.h ),
                   width: 310.w,
                   height: 70.h,
                   child: TextFormField(
                     controller: _emailController,
                     validator: MultiValidator([
                       RequiredValidator(errorText: 'Enter your email.'),
                       EmailValidator(errorText: 'Enter a valid email address.'),
                     ]),
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
                   margin: EdgeInsets.only(top: 403.h),
                   width: 310.w,
                   height: 70.h,
                   child: TextFormField(
                     style: const TextStyle(color: Colors.black),
                     obscureText: true,

                     decoration: InputDecoration(


                       hintText: "password",
                       focusColor: Tcolor.primary1,
                       suffixIcon: Icon(Icons.key),

                       border: OutlineInputBorder(

                       ),

                     ),
                     controller: _passwordController,
                     validator: MultiValidator([
                       RequiredValidator(errorText: 'Enter your password.'),
                       MinLengthValidator(8,
                           errorText: 'Password must be at least 8 characters long.'),
                       PatternValidator(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()]).{8,}$',
                           errorText:
                           'Password must contain at least one uppercase letter, one lowercase letter, one digit, and one special character.'),
                     ]),
                   ),

                 ),
               ),
               Container(
                 margin: EdgeInsets.only(top:473.h),

                 child: Center(
                   child: Text(
                     'By continuing, you agree to our Privacy Policy\nand our Terms of Service.',
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
                 child: GestureDetector(
                   // onTap: (){
                   //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreenMain(),));
                   // },
                   onTap: () async {
                     if (_formKey.currentState?.validate() ?? false) {
                       showDialog(context: context,
                           barrierDismissible: false,
                           builder: (context)=>Center(child: CircularProgressIndicator(),)
                       );
                       try {
                         UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                           email: _emailController.text.trim(),
                           password: _passwordController.text.trim(),
                         );
                         User? user = userCredential.user;
                         CircularProgressIndicator();
                         // final SharedPreferences sharedprefrences = await SharedPreferences.getInstance();
                         //
                         // sharedprefrences.setString("email", _emailController.text);
                         Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (context) => HomeScreenMain()),
                         );
                         print('Signed in: ${userCredential.user}');
                       } catch (e) {
                         Utils().toast(e.toString());
                       }
                     }

                   },
                   child: Container(
                     margin: EdgeInsets.only(top: 544.h),
                     width: 177.w,
                     height: 48.h,
                     decoration: ShapeDecoration(
                       color: Color(0xFF00B58D),
                       shape: RoundedRectangleBorder(
                         side: BorderSide(width: 0.50.w, color: Color(0xFF334853)),
                       ),
                     ),
                     child: Center(
                       child: Text(
                         'LOGIN',
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
               Container(
                 margin: EdgeInsets.only(top: 620.h),
                 child: Center(
                   child: GestureDetector(
                     onTap: (){
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignupScreen(),));
                     },
                     child: Text(
                       'Or Create Account?',
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
              margin: EdgeInsets.only(top: 700.h),
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
              margin: EdgeInsets.only(top: 750.h),
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
