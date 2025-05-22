import 'package:flutter/material.dart';

import '../models/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(post.id.toString()),
        ),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
      ),
    );
  }
}
