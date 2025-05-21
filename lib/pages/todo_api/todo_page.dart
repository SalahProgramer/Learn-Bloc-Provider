import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todo"),
      ),
      body: Center(
        child: Text(
          "Todo App",
        ),
      ),
    );
  }
}
