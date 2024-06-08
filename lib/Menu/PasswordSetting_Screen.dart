import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordSetting_Screen extends StatelessWidget{
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
                      
                      'password Setting',
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
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w ),

                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,

                    decoration: InputDecoration(
                      label: Text("Current Password"),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.4000000059604645)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.4000000059604645)),
                      ),

                    ),
                  ),

                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w ),
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,

                    decoration: InputDecoration(
                      label: Text("New Password"),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.4000000059604645)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.4000000059604645)),
                      ),

                    ),
                  ),

                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 20.h,left: 20.w,right: 20.w ),

                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,

                    decoration: InputDecoration(
                      label: Text("Confirm Password"),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 22.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,

                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.4000000059604645)),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black.withOpacity(0.4000000059604645)),
                      ),

                    ),
                  ),

                ),
              ),
              GestureDetector(

                child: Container(
                  margin: EdgeInsets.only(top: 80.h),
                  width: 167.w,
                  height: 42.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 167.w,
                          height: 42.h,
                          decoration: BoxDecoration(color: Color(0xFF00B58D)),
                        ),
                      ),
                      Positioned(
                        left: 45.w,
                        top: 5.h,
                        child: Text(
                          'Update',
                          style: TextStyle(
                            color: Color(0xFFF7FDFD),
                            fontSize: 21.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),


            ]
        )
    );
  }

}