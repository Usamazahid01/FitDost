import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoardingScreen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Container(
          //
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //
          //
          //         child: Image.asset("assets/images/BackGrounds/BackMaskOnBoarding1.png")),
          // ),
         Container(
           width: 390.w,
           height: 400.h,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BackGrounds/BackMaskOnBoarding1.png"),
            fit: BoxFit.fill,
          ),
        ),
         ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.h,left: 18.w),
                child: Text(
                  'PERSONALIZED  HEALTH PLANS',
                  style: TextStyle(
                    color: Color(0xFF4A4852),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0.07,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 18.h,left: 18.w),
                child: Text(
                  'Receive customized diet plans,\nworkout routines,and relaxation\ntechniques tailored to your needs.',
                  style: TextStyle(
                    color: Color(0xFF4A4852),
                    fontSize: 19,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                
                child: Text(
                  'Receive customized diet plans,\nworkout routines,and relaxation\ntechniques tailored to your needs.',
                  style: TextStyle(
                    color: Color(0xFF4A4852),
                    fontSize: 19,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }

}