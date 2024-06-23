import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class CheckCaloriesInFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00B58D),
        title: Text(
          "AI Check Calories In Food",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  static const apiKey = "AIzaSyByHdQC4VjeiRUxnkX-uJ9PJPwJD5SuUMc";
  // final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  var responsed = "";
  File? _image;

  // Future<String?> _pickAndConvertImage() async {
  //   ImagePicker imagePicker = ImagePicker();
  //   final XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
  //
  //   if (file != null) {
  //     final imageBytes = await File(file.path).readAsBytes();
  //     return base64Encode(imageBytes);
  //   }
  //   return null;
  // }
  Future<void> _pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        _image = File(file.path);
      });
    }
  }
  Future<void> _generateResponse() async {
    // final textContent = Content.text("Please tell the Calories in this food");

    final imageBytes = await File(_image!.path).readAsBytes();
    final content = [
      Content.multi([
        TextPart("Please tell the Calories in this food"),
        DataPart('image/png', imageBytes),
      ])
    ];

    // final imageContent = Content.image(base64: imageBase64);
    // content.add(imageContent);
    //
    // final content = [textContent, imageContent];
    final model = GenerativeModel(
      model: 'gemini-1.5-pro',
      apiKey: apiKey,
      safetySettings: [
        SafetySetting(HarmCategory.harassment, HarmBlockThreshold.medium),
        SafetySetting(HarmCategory.hateSpeech, HarmBlockThreshold.medium),
      ] ,
      systemInstruction: Content.system(
          'You are an AI Fitness Coach. Your Name is FitDost. Only answer the when user uploaded relivent photo of Food, Meal, your resposibilty is to give how many Calories  present in that food  . Avoid answering questions outside these areas.'),
    );
    // final model = GenerativeModel(model: 'gemini-1.5-pro', apiKey: apiKey);
    final response = await model.generateContent(content);

    setState(() {
      responsed = response.text ?? "No response from API";
    });
  }
  // Future<void> _generateResponse() async {
  //   if (_image == null) {
  //     print('No image selected');
  //     return;
  //   }
  //
  //   try {
  //     final textContent = Content.text("Please tell the Calories in this food");
  //
  //     final bytes = await _image!.readAsBytes();
  //     final base64Image = base64Encode(bytes);
  //     // final content = [Content.image(File(_image!.path))];
  //
  //
  //     // final imageContent = Content.image(File(_image!.path));
  //
  //     final content = [textContent];
  //
  //     final response = await model.generateContent(content);
  //
  //     setState(() {
  //       responsed = response.text ?? "No response from API";
  //     });
  //   } catch (error) {
  //     print('Error processing image: $error');
  //     setState(() {
  //       responsed = "Error processing image";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 18.w, top: 10.h),
                child: Text(
                  'Check Calories In Food \n with AI',
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
                margin: EdgeInsets.only(top: 30.h),
                width: 354.w,
                height: 286.h,
                decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                child: _image == null
                    ? Center(child: Text('No image selected'))
                    : Image.file(_image!),
              ),
            ],
          ),
          InkWell(
            onTap: _pickImage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  width: 177,
                  height: 48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.33,
                          child: Container(
                            width: 177,
                            height: 48,
                            decoration: BoxDecoration(color: Color(0xFF1D479B)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 177,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Color(0xFF00B58D),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.50, color: Color(0xFF334853)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 36,
                        top: 13,
                        child: Text(
                          'Upload Photo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: _generateResponse,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  width: 330,
                  height: 48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.33,
                          child: Container(
                            width: 330,
                            height: 48,
                            decoration: BoxDecoration(color: Color(0xFF1D479B)),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 330,
                          height: 48,
                          decoration: ShapeDecoration(
                            color: Color(0xFF00B58D),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.50, color: Color(0xFF334853)),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        child: Center(
                          child: Text(
                            'Generate Response',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 18),
            child: Text(
              'RESPONSE FROM AI',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          if (responsed.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 10.h, bottom: 40.h),
              padding: EdgeInsets.all(20),
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
                  Text(
                    responsed,
                    style: TextStyle(
                      color: Color(0xFF4A4852),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),

                ],
              ),
            ),
        ],
      ),
    );
  }
}
