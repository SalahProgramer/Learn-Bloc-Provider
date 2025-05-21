import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/todo_api.dart';
import '../../models/todo.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodoApi todoApi;

  TodosCubit(this.todoApi) : super(LoadingState());

  Future<void> getAllTodos() async {
    emit(LoadingState());
    try {
      final todos = await todoApi.getAllTodos();
      emit(CompletedState(todos: todos));
    } catch (error) {
      emit(ErrorsState(message: error.toString()));
    }
  }
}
