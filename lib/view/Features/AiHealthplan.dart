import 'package:fitdost_app/view/Features/TalkWithFitdostScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class Aihealthplan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor:  const Color(0xFF00B58D),
          title: Text("AI Health Plan", style: TextStyle(
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
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
      String userData = "I am a ${_ageController.text}-year-old ${_gender} who weighs ${_weightController.text} kg and is ${_heightController.text} cm tall. My goal is to ${_goal}. Please give me a diet plan for 1 week.";

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
            TextFormField(
              controller: _heightController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Height (cm)',
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
                  return 'Please enter your height';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _weightController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
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
                  return 'Please enter your weight';
                }
                return null;
              },
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
            Text('Goals', style: TextStyle(color: Colors.grey[700])),
            ListTile(
              title: const Text('Gain Weight'),
              leading: Radio<String>(
                value: 'Gain Weight',
                groupValue: _goal,
                onChanged: (String? value) {
                  setState(() {
                    _goal = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Lose Weight'),
              leading: Radio<String>(
                value: 'Lose Weight',
                groupValue: _goal,
                onChanged: (String? value) {
                  setState(() {
                    _goal = value;
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
            Center(
              child: Container(
                // margin: EdgeInsets.only(left: 18),
                child: Text(
                  'Response',
                  style: TextStyle(
                    color: Color(0xFF4A4852),
                    fontSize: 26,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),

                Text(responsed,
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
    );
  }
}
