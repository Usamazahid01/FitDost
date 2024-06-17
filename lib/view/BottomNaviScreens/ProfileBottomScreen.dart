import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBottomScreen extends StatefulWidget {
  @override
  State<ProfileBottomScreen> createState() => _ProfileBottomScreenState();
}

class _ProfileBottomScreenState extends State<ProfileBottomScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.exists) {
                final userData1 = snapshot.data!.data() as Map<String, dynamic>;
                final name1 = userData1["Username"] ?? "No Name";
                final email1 = userData1["email"] ?? "No Email";
                final imageUrlFromDatabase = userData1["ImageUrl"];
                print("imageeee =>"+imageUrlFromDatabase);

                return Column(
                  children: [
                    Container(
                      width: 390.w,
                      height: 345.h,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 390.w,
                              height: 293.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageUrlFromDatabase != null
                                      ? NetworkImage(imageUrlFromDatabase)
                                      : NetworkImage("assets/images/Icons/DefultProfilePic.png"), // Provide a placeholder image asset
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Color(0x89188A69).withOpacity(0.8),
                                    BlendMode.lighten,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 18,
                            top: 247,
                            child: Container(
                              width: 98,
                              height: 98,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: imageUrlFromDatabase != null
                                      ? NetworkImage(imageUrlFromDatabase)
                                      : NetworkImage("assets/images/Icons/DefultProfilePic.png"), // Provide a placeholder profile image asset
                                  fit: BoxFit.fill,
                                ),
                                shape: CircleBorder(
                                  side: BorderSide(width: 2, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                            name1,
                            style: TextStyle(
                              color: Color(0xFF4A4852),
                              fontSize: 22,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                            email1,
                            style: TextStyle(
                              color: Color(0xFF4A4852),
                              fontSize: 13,
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
              padding:EdgeInsets.only(left: 20.w,top: 10.h),
              child: Text(
              'Privacy Policy',
              style: TextStyle(
              color: Color(0xFF4A4852),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,

              ),
              ),
              ),


              ],

              ),
              Row(
              children: [
              Container(
              padding:EdgeInsets.only(left: 20.w),
              width: 342,
              child: Text(
              "\n1. Your privacy matters to us. We handle your personal information responsibly.\n 2. We do not share your data with third parties. Your information is safe with us.\n3. For more information, please contact us. ",
              style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              ),
              ),
              ),



              ],

              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
              padding:EdgeInsets.only(top: 40.h),
              child: Text(
              'do you want to delete your account?',
              style: TextStyle(
              color: Color(0xFF4A4852),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
              ),
              )
              ),





              ],

              ),
              GestureDetector(

              child: Container(
              margin: EdgeInsets.only(top: 5.h),
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
              decoration: BoxDecoration(color: Color(0xFFF83B57)),
              ),
              ),
              Positioned(
              left: 45.w,
              top: 5.h,
              child: Text(
              'Delete',
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
              ),// Other rows and widgets...
                  ],
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error ${snapshot.error.toString()}"));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
