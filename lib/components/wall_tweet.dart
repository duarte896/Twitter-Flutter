import 'package:flutter/material.dart';

class WallTweet extends StatelessWidget {
  final String message;
  final String user;
  const WallTweet({super.key, required this.message, required this.user});

  final url = 'http://placehold.it/150x150?text=A';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(children: [
        CircleAvatar(
          backgroundImage: NetworkImage(url),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          message,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
