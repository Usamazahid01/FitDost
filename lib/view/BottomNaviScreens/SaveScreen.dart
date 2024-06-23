

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/models/push_up_model.dart';
import 'package:fitdost_app/view/Features/AiHealthplan.dart';
import 'package:fitdost_app/view/Features/AiPushupscounter/views/pose_detection_view.dart';
import 'package:fitdost_app/view/Features/TalkWithFitdostScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Savescreen extends StatefulWidget{
  const Savescreen({super.key});

  @override
  State<Savescreen> createState() => _SavescreenState();
}

class _SavescreenState extends State<Savescreen> {
  User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                StreamBuilder<DocumentSnapshot>(
                  stream:FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).snapshots(),
            
            
                  builder: (context,snapsot) {
                    if(snapsot.hasData && snapsot.data!.exists) {
                      final userData = snapsot.data?.data() as Map<String, dynamic>;
                      final name = userData["Username"] ?? "No Name";
                      final Diteplan=userData["ResponseData"]??"no saved data";
                      final Workoutplan=userData["WorkoutPlan"] ?? "no saved Data";
                      return Column(
                        children: [
                          Row(
                            children: [
                      Container(
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
                    ),
            
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 18.w),
                                child: Text(
                                  'Your Saved Dite Plan',
                                  style: TextStyle(
                                    color: Color(0xFF4A4852),
                                    fontSize: 26,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                           Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Container(
                            margin: EdgeInsets.only(top: 10,bottom: 40),
                            padding: EdgeInsets.only(top: 40,bottom: 40,left: 10,right: 10),
                            width: 356,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(33),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 15.60,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ],
            
                            ),
                                child: Column(
            
                                  children: [
                                    Diteplan != null ?
                                    Text(Diteplan,
                                      style: TextStyle(
                                        color: Color(0xFF4A4852),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ) :Text("No Saved Data")
                                  ],
                                ),
                              ),
                              ],
                              ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 18.w),
                                child: Text(
                                  'Your Saved Workout Plan',
                                  style: TextStyle(
                                    color: Color(0xFF4A4852),
                                    fontSize: 26,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.h,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // workout plan
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10,bottom: 40),
                                padding: EdgeInsets.only(top: 40,bottom: 40,left: 10,right: 10),
                                width: 356,
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(33),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 15.60,
                                      offset: Offset(0, 0),
                                      spreadRadius: 0,
                                    )
                                  ],

                                ),
                                child: Column(

                                  children: [
                                    Workoutplan != null ?
                                    Text(Workoutplan,
                                      style: TextStyle(
                                        color: Color(0xFF4A4852),
                                        fontSize: 12,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ) :Text("No Saved Data \n To Genrate Workout plan from AI Go to Home Screen and use our AI Workout Plan Genrator",style: TextStyle(
                                      color: Color(0xFF4A4852),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          
                  ]
                      );
            
            
            
            
                    } else if(snapsot.hasError){
                      return Center(child: Text("Error "+ snapsot.error.toString()));
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  },
            
            
                ),
            
            
            
            
            
            
            
            
            
            
            
            
              ],
            
            
            ),
          ),


        );





  }
}