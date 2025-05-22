import 'package:flutter/material.dart';

import '../widgets/loading_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text("Posts"),
      ),
      body:  LoadingWidget(),
    );
  }
}
