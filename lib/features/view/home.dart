import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/components/drawer.dart';
import 'package:twitter/components/text_field.dart';
import 'package:twitter/components/wall_tweet.dart';
import 'package:twitter/constants/assets_constants.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/features/view/create_tweet.dart';

import 'package:twitter/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:twitter/features/auth/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _selectedIndex = 0;

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
                  IconButton(
                      onPressed: postMessage,
                      icon: const Icon(Icons.arrow_circle_up))
                ],
              ),
            )
          ]),
        ),
        /*body: Center(
          child: Column(children: [
            Expanded(
                child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User Tweets")
                  .orderBy("TimeStamp", descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data!.docs[index];
                      return WallTweet(
                          message: post["Message"], user: post["UserEmail"]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error:${snapshot.error}'),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateTweet()));
          },
          child: Icon(Icons.add),
        ),*/
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.homeLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.searchLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.notificationLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AssetsConstants.inboxLogo,
                // ignore: deprecated_member_use
                color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
                height: 30,
              ),
              label: '',
            ),
          ],
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
