import 'package:flutter/material.dart';

class Storys extends StatelessWidget {
  const Storys({super.key});

  final url = 'http://placehold.it/150x150?text=A';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(url),
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
