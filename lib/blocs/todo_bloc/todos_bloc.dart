import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnblocprovider/api/todo_api.dart';

import '../../models/todo.dart';

part 'todos_event.dart';

part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoApi todoApi;
  TodosBloc(this.todoApi) : super(LoadingState()) {
    on<TodosEvent>((event, emit) async {
      if (event is GetAllTodosEvent) {
        emit(LoadingState());
        try {
          final todos = await todoApi.getAllTodos();
          emit(CompletedState(todos: todos));
        } catch (error) {
          emit(ErrorsState(message: error.toString()));
        }
      }
    });
  }
}
