import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsScreen extends StatelessWidget{
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
                  'About Us',
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
                        "We're thrilled to introduce a revolutionary approach to enhancing your health and wellness journey. Crafted with Flutter and Dart, our app ensures seamless usability across all devices. By harnessing the prowess of artificial intelligence (AI) and integrating profound spiritual teachings, we've curated a transformative experience for you. Get ready to embark on a path towards holistic well-being, where technology meets enlightenment.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
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
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 60,top: 30),
              child:  Image.asset('assets/images/Aboutuslogo.png'),


              ),

            ],

          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:130,top: 140),
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