
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/Drawer/Drawer.dart';
import 'package:fitdost_app/Menu/AboutUsScreen.dart';
import 'package:fitdost_app/Menu/ProfileSettings_Screen.dart';
import 'package:fitdost_app/view/BottomNaviScreens/ProfileBottomScreen.dart';
import 'package:fitdost_app/view/BottomNaviScreens/SaveScreen.dart';
import 'package:fitdost_app/view/Features/TalkWithFitdostScreen.dart';
import 'package:fitdost_app/view/home/HomeScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenMain extends StatefulWidget{
  const HomeScreenMain({super.key});

  @override
  State<HomeScreenMain> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenMain> {
  User? currentUser = FirebaseAuth.instance.currentUser;
  final Screns=[
    Savescreen(),
    HomeScreen(),
    ProfileBottomScreen(),

  ];
  int myIndex=1;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF00B58D),
      child: Scaffold(

        appBar: AppBar(
          // leading: new Icon(Icons.menu,color: Colors.white,),
          iconTheme: IconThemeData(

              size: 35,

              color: Colors.white),
          backgroundColor:  const Color(0xFF00B58D),
          actions: [

            StreamBuilder<DocumentSnapshot>(
              stream:FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).snapshots(),


              builder: (context,snapsot) {
                if(snapsot.hasData && snapsot.data!.exists) {
                  final userData = snapsot.data!.data() as Map<String, dynamic>;

                  final ImageUrlfromdatabase = userData["ImageUrl"] ;
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        child:  ImageUrlfromdatabase != null ? CircleAvatar(
                          radius: 20,
                          backgroundImage:NetworkImage(ImageUrlfromdatabase),

                        ): CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage("assets/images/Icons/DefultProfilePic.png"),

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

            // Container(
            //   margin: const EdgeInsets.only(right: 20),
            //   child: const CircleAvatar(
            //     radius: 20,
            //     backgroundImage:NetworkImage('https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            //
            //   ),
            // ),

          ],



        ),
        drawer: NevigationDrawer(),
        body: Screns[
        myIndex
        ],



        bottomNavigationBar: BottomNavigationBar(

          elevation: 10,
          currentIndex: myIndex,
          // unselectedItemColor: Colors.black,

          onTap: (index){


            setState(() {

              myIndex=index;
            });
          },
          selectedItemColor: Color(0xFF1D479B),
          unselectedItemColor: Colors.black,
          // selectedIconTheme: IconThemeData(color: Colors.white),
          items: [



            BottomNavigationBarItem(


              icon:  SvgPicture.asset(
                'assets/images/Icons/SaveIcon.svg',
                color: myIndex == 0 ? Color(0xFF1D479B): Colors.black,
                width: 23.w,
                height: 19.h,
              ),

              label: 'Save',



            ),
            BottomNavigationBarItem(
              icon:  SvgPicture.asset(
                'assets/images/Icons/HomeIcon.svg',
                color: myIndex == 1 ? Color(0xFF1D479B): Colors.black,
                width: 23.w,
                height: 19.h,

              ),
              label: 'Home',

            ),
            BottomNavigationBarItem(

              icon:  SvgPicture.asset(
                'assets/images/Icons/ProfileIcon.svg',
                color: myIndex == 2 ? Color(0xFF1D479B): Colors.black,
                width: 23,
                height: 19,


              ),

              label: 'Profile',

            ),
          ],
        ),
      ),


    );

  }
}