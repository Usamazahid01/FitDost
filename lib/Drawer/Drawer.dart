
import 'package:fitdost_app/Menu/AboutUsScreen.dart';
import 'package:fitdost_app/Menu/PasswordSetting_Screen.dart';
import 'package:fitdost_app/Menu/PrivacyPolicyScreen.dart';
import 'package:fitdost_app/Menu/ProfileSettings_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class NevigationDrawer extends StatelessWidget{
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
        CircleAvatar(
          radius: 52,
         backgroundImage:NetworkImage('https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),

        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'Usama zahid',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Text(
          'info@gmail.com',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            height: 0,
          ),
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
          onTap:() => Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>  PasswordSetting_Screen(),

          )),
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