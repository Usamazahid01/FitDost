import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSettingsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: const Color(0xFF00B58D),
      ),
      body:  SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding:EdgeInsets.only(left: 20.w,top: 30.h),
                    child: Text(

                      'Profile Setting',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 76,
                    height: 76,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(
                        side: BorderSide(width: 2, color: Color(0xFF5A728C)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add functionality to change profile photo
                },
                child: Text(
                  'Change profile photo',
                  style: TextStyle(
                    color: Color(0xFF00B58D),
                    fontSize: 12,
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w700,
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
                      label: Text("Name"),
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
                      label: Text("Email"),
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
          ),
        ),

    );
  }
}

