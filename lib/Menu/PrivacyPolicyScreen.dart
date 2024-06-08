import 'package:flutter/cupertino.dart';
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
                      height: 230.h,
                      child: Text(
                      "\n1. Your privacy matters to us. We handle your personal information responsibly.\n\n2. We do not share your data with third parties. Your information is safe with us.\n\n3. For more information, please contact us.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),


                    )
                ),
              )
            ],
          ),
          SizedBox(height: 40.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 241,
                height: 134,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Logo/LightOpecityLogo.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              )

            ],

          ),
          SizedBox(height:180.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'V 1.0',
                style: TextStyle(
                  color: Color(0xFF4A4852),
                  fontSize: 10.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                '© 2024 FitDost. All rights reserved',
                style: TextStyle(
                  color: Color(0xFF4A4852),
                  fontSize: 8.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),


            ],
          ),



        ],

      ),
    );
  }

}