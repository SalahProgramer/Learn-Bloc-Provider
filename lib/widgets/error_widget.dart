import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocprovider/blocs/todo_bloc/todos_bloc.dart';
import 'package:learnblocprovider/cubits/todo_cubit/todos_cubit.dart';

class MyErrorWidget extends StatelessWidget {
  final String message;

  const MyErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    // final todo = BlocProvider.of<TodosBloc>(context);
    final todo = context.read<TodosCubit>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Text(message,
                style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
          ),
          ElevatedButton(
              onPressed: () async {
               await todo.getAllTodos();
              },
              child: Text("Try again"))
        ],
      ),
    );
  }
}
