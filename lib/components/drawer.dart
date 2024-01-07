import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter/features/auth/auth.dart';

class MyDrawer extends StatelessWidget {
  final BuildContext context;
  MyDrawer({super.key, required this.context});

  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> signOut() async {
    try {
      await Auth().signOut();
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/loginHome');
    } on FirebaseAuthException catch (error) {
      print(error.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('http://placehold.it/150x150?text=A'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(currentUser.email!)],
                  ),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('List'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Moments'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: const Text('Log Out'),
            onTap: () {
              signOut();
            },
          ),
        ],
      ),
    );
  }
}
