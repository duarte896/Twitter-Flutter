import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter/components/bottom_nav_bar.dart';
import 'package:twitter/components/drawer.dart';
import 'package:twitter/components/story_box.dart';
import 'package:twitter/components/text_field.dart';
import 'package:twitter/components/wall_tweet.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIndex = 0;

  final currentUser = FirebaseAuth.instance.currentUser!;

  final textController = TextEditingController();

  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('User Tweets').add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
      });
    }
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.secondTheme,
      child: Scaffold(
        appBar: UIConstants.homeNav(),
        drawer: MyDrawer(
          context: context,
        ),
        body: Center(
          child: Column(children: [
            Storys(),
            Divider(
              color: Colors.grey,
            ),
            // the wall
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('User Tweets')
                  .orderBy('TimeStamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];
                      return WallTweet(
                          message: post['Message'], user: post['UserEmail']);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )),
            //post message
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  Expanded(
                      child: MyTextField(
                    controller: textController,
                    hintText: "What's happening?",
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.blue,
                    onPressed: () {
                      postMessage();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            )
          ]),
        ),
        bottomNavigationBar: BottomNavBar(
          selectedIndex: selectedIndex,
          onIndexChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
