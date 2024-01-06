import 'package:flutter/material.dart';

class WallTweet extends StatelessWidget {
  final String message;
  final String user;
  const WallTweet({super.key, required this.message, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Text(style: TextStyle(color: Colors.black), user),
          Text(style: TextStyle(color: Colors.black), message)
        ])
      ],
    );
  }
}
