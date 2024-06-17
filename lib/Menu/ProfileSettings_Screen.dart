import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
class ProfileSettingsScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _newnameController = TextEditingController();
  final _emailController = TextEditingController();
  User? currentUser = FirebaseAuth.instance.currentUser;
  String imageUrl="";
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


              StreamBuilder<DocumentSnapshot>(
                stream:  FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).snapshots(),


                builder: (context,snapsot) {
                  if(snapsot.hasData) {
                    final userData = snapsot.data!.data() as Map<String, dynamic>;
                    final name = userData["Username"] ?? "No Name";
                    final email = userData["email"] ?? "No Email";
                    final ImageUrlfromdatabase = userData["ImageUrl"] ;

                    _newnameController.text = name;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageUrlfromdatabase  != null ?  Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 76,
                              height: 76,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    ImageUrlfromdatabase,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                shape: OvalBorder(
                                  side: BorderSide(width: 2, color: Color(0xFF5A728C)),
                                ),
                              ),
                            ):Container(
                              margin: EdgeInsets.only(top: 20),
                              width: 76,
                              height: 76,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/images/Icons/DefultProfilePic.png"),
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
                          onPressed: () async{
                            ImagePicker imagePicker = ImagePicker();
                            XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

                            if (file == null) {
                              print('No file selected');
                              return;
                            }

                            print('File path: ${file.path}');
                            String uniqueName = DateTime.now().millisecondsSinceEpoch.toString();

                            Reference referenceRoot = FirebaseStorage.instance.ref();
                            Reference referenceDirImage = referenceRoot.child('images');
                            Reference referenceImageToUpload = referenceDirImage.child(uniqueName);

                            try {
                              print('Uploading image...');
                              await referenceImageToUpload.putFile(File(file.path));
                              imageUrl = await referenceImageToUpload.getDownloadURL();
                              print('Image URL: $imageUrl');
                              // Here you can save the imageUrl to Firestore or use it as needed
                              FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).update(
                                  {
                                    "ImageUrl":imageUrl,
                                  }

                              );



                            } catch (error) {
                              print('Error uploading image: $error');
                            }
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

                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                               // initialValue:name,
                              controller:  _newnameController,



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
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              initialValue:email,

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
                      ],
                    );
                  } else if(snapsot.hasError){
                    return Center(child: Text("Error "+ snapsot.error.toString()));
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }
                },


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
                        child: GestureDetector(
                          onTap: () async
                          {
                            if( _newnameController.text.trim().isEmpty){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Please Enter UserName")),
                              );
                            }else{
                              FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).update(
                                {
                                  "Username":_newnameController.text.trim(),

                                },);
                              ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Username update Sucessfully")),
                                    );

                            }


                          },
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

