
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFF00B58D),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding:EdgeInsets.only(left: 20.w,top: 30.h),
                child: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Color(0xFF4A4852),
                    fontSize: 22.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),

            ],

          ),
          Row(
            children: [
              Container(
                child: Container(
                    padding:EdgeInsets.only(left: 20.w,top: 25.h),
                    child: SizedBox(
                    width: 354.w,
                    height: 263.h,
                      child: Text(
                        "\n1. Your privacy matters to us. We handle your personal information responsibly.\n\n2. We do not share your data with third parties. Your information is safe with us.\n\n3. For more information, please contact us.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),

                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 60.w,top: 30.h),
                child:  Image.asset('assets/images/Aboutuslogo.png'),


              ),

            ],

          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 130,top: 140),
                child: Container(
                  width: 132.w,
                  height: 32.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 52.w,
                        top: 0,
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
                      Positioned(
                        left: 0,
                        top: 20.h,
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
                    ],
                  ),
                ),
              )
            ],
          )



        ],

      ),
    );
  }

}