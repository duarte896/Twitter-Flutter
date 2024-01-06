import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twitter/constants/assets_constants.dart';
import 'package:twitter/constants/ui_constants.dart';
import 'package:twitter/features/view/tweet.dart';
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

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    try {
      await Auth().signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/');
    } on FirebaseAuthException catch (error) {
      setState(() {
        print(error.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.secondTheme,
      child: Scaffold(
        appBar: UIConstants.homeNav(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('http://placehold.it/150x150?text=A'),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('User'), Text('@user')],
                    )
                  ],
                ),
              ),
              ListTile(
                title: const Text('Profile'),
                selected: _selectedIndex == 0,
                onTap: () {},
              ),
              ListTile(
                title: const Text('List'),
                selected: _selectedIndex == 0,
                onTap: () {},
              ),
              ListTile(
                title: const Text('Moments'),
                selected: _selectedIndex == 0,
                onTap: () {},
              ),
              Divider(),
              ListTile(
                title: const Text('Log Out'),
                selected: _selectedIndex == 0,
                onTap: () {
                  signOut();
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('http://placehold.it/150x150?text=A'),
                ),
              ]),
            ),
            Divider(
              color: Colors.grey,
            ),
            ChatItem()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
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
