import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter/constants/ui_constants.dart';

class Storys extends StatelessWidget {
  Storys({super.key});
  final currentUser = FirebaseAuth.instance.currentUser!;

  final url = 'http://placehold.it/150x150?text=A';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'http://placehold.it/150x150?text=${UIConstants.userID(currentUser.email!)}'),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
        ],
      ),
    );
  }
}
