
import 'package:fitdost_app/view/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'assets/images/BackGrounds/LoginSignupBack.png',
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/Logo/FitDostLogoWhite.png',
                        width: 168.w,
                        height: 93.h,
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: 124.w,
                        height: 48.h,
                        margin: EdgeInsets.only(left: 50),
                        child: Text(
                          'Login', // Set the heading to 'Login'
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    width: 354.w,
                    height: 468.h,
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 9,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildFormField(
                            controller: _emailController,
                            hintText: 'Email',
                            icon: Icons.email,
                          ),
                          SizedBox(height: 20.h),
                          _buildFormField(
                            controller: _passwordController,
                            hintText: 'Password',
                            icon: Icons.lock,
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: 210.w,
                            height: 30.h,
                            child: Center(
                              child: Text(
                                'By continuing, you agree to our Privacy Policy and our Terms of Service.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Cabin',
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: 172.w,
                            height: 52.h,
                            child: ElevatedButton(
                              // onPressed: () {
                              //   if (_formKey.currentState!.validate()) {
                              //     // Implement login logic here
                              //     String email = _emailController.text.trim();
                              //     String password = _passwordController.text.trim();
                              //     // Perform authentication with email and password
                              //   }
                              // },
                              onPressed:() => Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context)=>  HomeScreen(),

                              )),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF00B58D),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(builder: (context) => const SignupScreen()),
                              // );
                            },
                            child: Text(
                              'or Create Account',
                              style: TextStyle(
                                color: Color(0xFF1D479B),
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(width: 1.w, color: Colors.black),


      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                obscureText: hintText == 'Password',
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter $hintText';
                  }
                  return null;
                },
              ),
            ),
            Container(
              width: 25.w,
              height: 25.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                icon,
                color: Color(0xFF1D479B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
