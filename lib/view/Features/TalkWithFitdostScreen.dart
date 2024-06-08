import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';

class TalkWithFitdostScreen extends StatefulWidget{
  @override
  State<TalkWithFitdostScreen> createState() => _TalkWithFitdostScreenState();
}

class _TalkWithFitdostScreenState extends State<TalkWithFitdostScreen> {
  final _userMassege = TextEditingController();
  static const apiKey= "AIzaSyByHdQC4VjeiRUxnkX-uJ9PJPwJD5SuUMc";
  final model = GenerativeModel(model:'gemini-pro',apiKey:apiKey);

  final List<Message> _message=[];


  Future<void> sendMessage() async{
    final message=_userMassege.text;
    _userMassege.clear();

    setState(() {
      _message.add(Message(isUser: true, message: message, date: DateTime.now()));
    });

    final content=[Content.text(message)];
    final response=await model.generateContent(content);
setState(() {
  _message.add(Message(isUser: false, message: response.text ?? "", date: DateTime.now()));
});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  const Color(0xFF00B58D),
        title: Text("Chat With FitDost", style: TextStyle(
            color: Colors.white
        ),),
      ),
      body: Column(
mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(child: ListView.builder(itemCount: _message.length, itemBuilder: ( context,  index) {
            final message =_message[index];
            return Messages(isUser: message.isUser, message: message.message, date: DateFormat("HH:mm").format(message.date),);

          },)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: TextFormField(
                    controller: _userMassege,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius:  BorderRadius.circular(50)),
                      label: const Text("Enter your Message"),

                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                    padding: const EdgeInsets.all(15),
                    iconSize: 30,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        const CircleBorder(),
                      ),
                    ),

                    onPressed: (){
                      sendMessage();

                    },
                    icon: const Icon(Icons.send),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Messages extends StatelessWidget{
  final bool isUser;
  final String message;
  final String date;
  const Messages(
  {super.key,
  required this.isUser,
  required this.message,
  required this.date}
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
        left: isUser ? 100:10,
        right: isUser ? 10:100,
      ),
      decoration: BoxDecoration(
        color: isUser ? const Color.fromARGB(255, 9, 48, 79)
        : Colors.grey.shade300,
        borderRadius:  BorderRadius.only(
          topLeft: const Radius.circular(10),
          bottomLeft: isUser ? const Radius.circular(10): Radius.zero,
          topRight: const Radius.circular(10),
          bottomRight: isUser? Radius.zero: const Radius.circular(10),
        )

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(color: isUser ? Colors.white: Colors.black),
          ),
          Text(date,
          style: TextStyle(
            color: isUser ? Colors.white: Colors.black),
          ),
        ],
      ),
    );
  }

}
class Message{
  final bool isUser;
  final String message;
  final DateTime date;
  Message({
    required this.isUser,
    required this.message,
    required this.date,
});
}
