import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                    padding:EdgeInsets.only(left: 20,top: 30),
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
                  margin: EdgeInsets.only(top: 20.h,left: 20,right: 20 ),
                  // width: 380.w,
                  // height: 46.h,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),

                    decoration: InputDecoration(
                      label: Text("Current Password"),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      // contentPadding: const EdgeInsets.fromLTRB(2, 0, 0, 0),

                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),

                    ),
                  ),

                ),
              ),



            ]
        )
    );
  }

}