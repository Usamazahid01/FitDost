import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitdost_app/view/Features/TalkWithFitdostScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiWorkoutPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFF00B58D),
        title: Text("AI WorkOut Plan", style: TextStyle(
            color: Colors.white
        ),),
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

  User? currentUser = FirebaseAuth.instance.currentUser;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  String? _exercises;
  String? _gender;
  String? _goal;
  static const apiKey = "AIzaSyByHdQC4VjeiRUxnkX-uJ9PJPwJD5SuUMc";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
  var responsed= "";
  List<Message> _messages = []; // List to store user and Gemini messages

  // Future<void> _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //
  //     // Prepare user data for chat screen
  //     String userData = "I am a ${_ageController.text}-year-old ${_gender} who weighs ${_weightController.text} kg and is ${_heightController.text} cm tall. My goal is to ${_goal}. Please give me a diet plan for 1 week.";
  //
  //     final content = [Content.text(userData)];
  //     responsed = await model.generateContent(content).toString();
  //     print("this iss respnse"+responsed);
  //
  //
  //
  //   }
  // }
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Prepare user data for chat screen
      String userData = "I am a ${_ageController.text}-year-old i am ${_gender} who goal is to ${_goal} , i am doing  ${_exercises} . Please give me a Workout or Exercise plan  of 1 week. please give me short and to the point and do not bold any text";

      final content = [Content.text(userData)];

      try {
        final response = await model.generateContent(content);
        if (response != null && response is GenerateContentResponse) {
          responsed = response.text!; // Access the text property from the response
        } else {
          responsed = "Failed to generate content.";
        }
      } catch (e) {
        responsed = "Error: ${e.toString()}";
      }

      print("this is response: $responsed");


    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _ageController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Age',
                labelStyle: TextStyle(color: Colors.grey[700]),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]!),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00BFA5)),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Text('Goals', style: TextStyle(color: Colors.grey[700])),
            ListTile(
              title: const Text('Weight Gain'),
              leading: Radio<String>(
                value: 'Weight Gain',
                groupValue:_goal,
                onChanged: (String? value) {
                  setState(() {
                    _goal = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Weight Lose'),
              leading: Radio<String>(
                value: 'Weight Lose',
                groupValue: _goal,
                onChanged: (String? value) {
                  setState(() {
                    _goal = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Gender', style: TextStyle(color: Colors.grey[700])),
            ListTile(
              title: const Text('Male'),
              leading: Radio<String>(
                value: 'Male',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Female'),
              leading: Radio<String>(
                value: 'Female',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Which Exercises?', style: TextStyle(color: Colors.grey[700])),
            ListTile(
              title: const Text('yoga'),
              leading: Radio<String>(
                value: 'yoga',
                groupValue: _exercises,
                onChanged: (String? value) {
                  setState(() {
                    _exercises = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Gym'),
              leading: Radio<String>(
                value: 'Gym',
                groupValue: _exercises,
                onChanged: (String? value) {
                  setState(() {
                    _exercises = value;
                  });
                },
              ),
            ),

            SizedBox(height: 20),
            Container(
              width: 5    , // Set the desired width here
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF00BFA5),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')),

                    );
                    _submitForm();
                    setState(() {

                    });
                  }
                },
                child: Text(
                  'Genrate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
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

            // Stack(
            //   children: [
            //
            //   ],
            // ),
            Column(

            ),
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
              child:Column(
                children: [
                  Text(responsed,
                    style: TextStyle(
                      color: Color(0xFF4A4852),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ) ,
                  responsed.isNotEmpty ? Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: FloatingActionButton(
                      onPressed: () async {
                        // Assuming `responsed` contains the generated response text
                        String responseText = responsed;

                        // Update Firestore with the generated response
                        try {
                          print('Saving response data...');
                          await FirebaseFirestore.instance.collection("Users").doc(currentUser?.email).update({
                            "WorkoutPlan": responseText,
                          });
                          print('Response data saved successfully');
                        } catch (error) {
                          print('Error saving response data: $error');
                          // Handle error as needed
                        }
                      },
                      backgroundColor: Color(0xFF00B58D), // Background color
                      child: Stack(
                        alignment: Alignment.center,
                        children: [

                          Icon(Icons.save, color: Colors.white), // White icon

                        ],
                      ),
                    ),
                  ):Text(""),

                ],

              ),




            ),

          ],
        ),
      ),
    );
  }
}
