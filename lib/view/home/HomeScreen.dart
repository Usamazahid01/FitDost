

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/view/Features/AiPushupscounter/views/pose_detection_view.dart';
import 'package:fitdost_app/view/Features/TalkWithFitdostScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF00B58D),
      child: Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            StreamBuilder<DocumentSnapshot>(
              stream:FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).snapshots(),


              builder: (context,snapsot) {
                if(snapsot.hasData && snapsot.data!.exists) {
                  final userData = snapsot.data?.data() as Map<String, dynamic>;
                  final name = userData["Username"] ?? "No Name";
                  return Container(
                    margin: EdgeInsets.only(top: 23.h,left: 18.w),
                    child: Text(
                      'Hi '+ name,
                      style: TextStyle(
                        color: Color(0xFF4A4852),
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.h,
                      ),
                    ),
                  );
                } else if(snapsot.hasError){
                  return Center(child: Text("Error "+ snapsot.error.toString()));
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },


            ),



            Container(
              margin: EdgeInsets.only(left: 18.w),
              child: Text(
                'Lets Start',
                style: TextStyle(
                  color: Color(0xFF4A4852),
                  fontSize: 26,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.h,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        width: 354.w,
                        height: 160.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFF1D479B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x49000000),
                              blurRadius: 9.70,
                              offset: Offset(0, 5),
                              spreadRadius: 0,
                            )
                          ],
                        ),

                      ),
                      Positioned(
                        left: 17.w,
                        top: 56.h,
                        child: Text(
                          'Personalized \nHealth Plans',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            height: 1.5.h,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17.w,
                        top: 110.h,
                        child: Text(
                          'Receive customized diet plans, workout\nroutines,and relaxation techniques tailored\nto your needs.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,

                          ),
                        ),
                      ),
                      Positioned(
                        left: 180,
                        top: 0,

                        // child: Image.asset("assets/images/BackGrounds/card1.png"),
                        child: Container(

                          width: 145.w,
                          height: 175.h,
                          // alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: new AssetImage("assets/images/BackGrounds/card1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ],

            ),
            Container(
              margin: EdgeInsets.only(left: 18.w,top: 15.h,bottom: 10.h),
              child: Text(
                'Other Features',
                style: TextStyle(
                  color: Color(0xFF4A4852),
                  fontSize: 18.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.h,
                ),
              ),
            ),

            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PoseDetectorView(),));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 354.w,
                              height: 110.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFF6D6E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x49000000),
                                    blurRadius: 9.70,
                                    offset: Offset(0, 5),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 17.w,
                              top: 15.h,
                              child:  Text(
                                'Emotion\nRecognition',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.5.h,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 17.w,
                              top: 70.h,
                              child:  Text(
                                'Identify and manage your emotions effectively\nwith our AI-powered recognition tool.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                                left: 259.w,
                                top: 28.h,
                                child:  SvgPicture.asset("assets/images/Icons/FaceRecogIcon.svg")
                            ),

                          ],
                        ),
                      ],

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15.h),
                        child: Stack(
                          children: [
                            Container(
                              width: 354.w,
                              height: 110.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFCA263),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x49000000),
                                    blurRadius: 9.70,
                                    offset: Offset(0, 5),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              left: 17.w,
                              top: 15.h,
                              child:  Text(
                                'Quranic Verses\nfor Peace',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  height: 1.5.h,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 17.w,
                              top: 70.h,
                              child:  Text(
                                'Discover serenity and calmness through\nselected verses from the Quran.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 7,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 239.w,
                              top: 28.h,
                              child: Image.asset("assets/images/Icons/QuranIcon.png"),
                            ),

                          ],
                        ),
                      ),
                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TalkWithFitdostScreen(),));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 15.h),
                          child: Stack(
                            children: [
                              Container(
                                width: 354.w,
                                height: 110.h,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1D479B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x49000000),
                                      blurRadius: 9.70,
                                      offset: Offset(0, 5),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 17.w,
                                top: 15.h,
                                child:  Text(
                                  'Talk with\nFitDost',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    height: 1.5.h,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 17.w,
                                top: 70.h,
                                child:  Text(
                                  'Engage in real-time conversations with\nour AI assistant for personalized advice and support.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 7,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                  left: 259.w,
                                  top: 28.h,
                                  child:  SvgPicture.asset("assets/images/Icons/MessageIcon.svg")
                              ),

                            ],
                          ),
                        ),
                      ),
                    ],

                  ),


                ],
              ),
            )





          ],


        ),


      ),


    );

  }
}