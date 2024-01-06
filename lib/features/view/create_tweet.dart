import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/theme/app_theme.dart';

class CreateTweet extends StatefulWidget {
  const CreateTweet({super.key});

  @override
  State<CreateTweet> createState() => CreateTweetState();
}

class CreateTweetState extends State<CreateTweet> {
  final TextEditingController _controllerTweet = TextEditingController();

  final currentUser = FirebaseAuth.instance.currentUser!;

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: title,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }

  void postMessages() {
    if (_controllerTweet.text.isNotEmpty) {
      FirebaseFirestore.instance.collection("User Tweets").add({
        'UserEmail': currentUser,
        'Message': _controllerTweet.text,
        'TimeStamp': FieldValue.serverTimestamp()
      });
      _controllerTweet.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    const url = 'http://placehold.it/150x150?text=A';

    return Theme(
      data: AppTheme.secondTheme,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          title: Row(
            children: [
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {
                  postMessages();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: Text('Tweet'),
              ),
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(url),
                ),
                SizedBox(width: 16),
                _entryField("What's happening?", _controllerTweet)
              ],
            )),
      ),
    );
  }
}
