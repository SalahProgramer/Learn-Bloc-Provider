import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocprovider/widgets/error_widget.dart';
import 'package:learnblocprovider/widgets/loading_widget.dart';
import 'package:learnblocprovider/widgets/todos_widget.dart';

import '../../blocs/todo_bloc/todos_bloc.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text("Todo"),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is CompletedState) {
            return TodosWidget(todos: state.todos);
          }
          if (state is ErrorsState) {
            return MyErrorWidget(message: state.message);
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }
}
