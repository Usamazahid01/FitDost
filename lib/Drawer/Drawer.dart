
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitdost_app/Menu/AboutUsScreen.dart';
import 'package:fitdost_app/Menu/PasswordSetting_Screen.dart';
import 'package:fitdost_app/Menu/PrivacyPolicyScreen.dart';
import 'package:fitdost_app/Menu/ProfileSettings_Screen.dart';
import 'package:fitdost_app/view/login/LoginScreen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NevigationDrawer extends StatefulWidget{
  @override
  State<NevigationDrawer> createState() => _NevigationDrawerState();
}


class _NevigationDrawerState extends State<NevigationDrawer> {

  User? currentUser = FirebaseAuth.instance.currentUser;
  // Future<void>signout()
  // async {
  //   await _firebase.auth.signOut();
  // }
  // void _signOut() {
  //   FirebaseAuth.instance.signOut();
  //   //print('$user');
  //   runApp(
  //       new MaterialApp(
  //         home: new LoginScreen2(),
  //       )
  //
  //   );
  // }
  Future<void> _signOut() async {
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.remove("email");
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen2()),
          (Route<dynamic> route) => false,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("User logged out successfully")),
    );
  }

  @override
  Widget build(BuildContext context) => Drawer(

    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          buildHeader(context),
          buildMenueItems(context),

        ],
      ),
    ),

  );

  Widget buildHeader(BuildContext context) =>Container(
    color: Color(0xFF00B58D),
    padding: EdgeInsets.only(
      top:24+ MediaQuery.of(context).padding.top,
      bottom: 24,
    ),
    child: Column(
      children: [

        StreamBuilder<DocumentSnapshot>(
          stream:FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).snapshots(),


          builder: (context,snapsot) {
            if(snapsot.hasData && snapsot.data!.exists) {
              final userData = snapsot.data!.data() as Map<String, dynamic>;
              final name = userData["Username"] ?? "No Name";
              final email = userData["email"] ?? "No Email";
              final ImageUrlfromdatabase = userData["ImageUrl"] ;
              return Column(
                children: [
                  ImageUrlfromdatabase != null ?
                  CircleAvatar(
                    radius: 52,
                    backgroundImage:NetworkImage(ImageUrlfromdatabase),

                  ):CircleAvatar(
                    radius: 52,
                    backgroundImage: AssetImage("assets/images/Icons/DefultProfilePic.png"),

                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    name ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.h,
                    ),
                  ),
                  Text(
                    email,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      height: 0.h,
                    ),
                  ),
                ],
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

  );

  Widget buildMenueItems(BuildContext context)=>Container(
    padding: const EdgeInsets.all(24),
    child: Column(
      children: [
        ListTile(
          leading:  Image.asset('assets/images/Icons/profileIcon2.png'),
          title: Text(
    'Profile Settings',
    style: TextStyle(
    color: Color(0xFF4A4852),
    fontSize: 16.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 0,
    ),),
    onTap:() => Navigator.of(context).push(MaterialPageRoute(
      builder: (context)=>  ProfileSettingsScreen(),

    )),
        ),
        const Divider(color: Color(0x66888888),),
        ListTile(
          leading: Image.asset('assets/images/Icons/PasswardSettingsIcon.png'),
          title: Text(
            'Password Settings',
            style: TextStyle(
              color: Color(0xFF4A4852),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),),
          onTap:() => Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>  PasswordSetting_Screen(),

          )),
        ),
        const Divider(color: Color(0x66888888),),
        ListTile(
          leading: Image.asset('assets/images/Icons/AboutUsIcon.png'),
          title: Text(
            'About Us',
            style: TextStyle(
              color: Color(0xFF4A4852),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),),
            onTap:() => Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>  AboutUsScreen(),

            )),

        ),
        const Divider(color: Color(0x66888888),),
        ListTile(
          leading: Image.asset('assets/images/Icons/PrivacyPolicyIcon.png'),
          title: Text(
            'Privacy Policy',
            style: TextStyle(
              color: Color(0xFF4A4852),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),),
  onTap:() => Navigator.of(context).push(MaterialPageRoute(
  builder: (context)=>  PrivacyPolicyScreen(),
  )),

        ),
        const Divider(color: Color(0x66888888),),
        ListTile(
          leading: SvgPicture.asset("assets/images/Icons/LogOutIcon.svg"),
          title: Text(
            'Logout',
            style: TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),),
          // onTap:() => Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context)=>  PasswordSetting_Screen(),
          //
          // )),
          // onTap:()async {
          //   await FirebaseAuth.instance.signOut().then((value) {
          //     User.SnackBar("Logout","User Logout Sucessfully");
          //     User.ofAll(LoginScreen2());
          //
          //   }).onError((error, stackTrace) {
          //     Get.SnackBar("Logout","Logout Error!");
          //   });
          //
          // },
          onTap: _signOut,
        ),
        Container(
          margin: EdgeInsets.only(top: 90.h),
          child: Text(
            'V 1.0',
            style: TextStyle(
              color: Color(0xFF4A4852),
              fontSize: 16.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 80.h),
          child: Text(
            '© 2024 FitDost. All rights reserved',
            style: TextStyle(
              color: Color(0xFF4A4852),
              fontSize: 8.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,

            ),
          ),
        ),
      ],

    ),
  );
}