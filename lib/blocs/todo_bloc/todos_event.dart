part of 'todos_bloc.dart';

@immutable
sealed class TodosEvent {}


class GetAllTodosEvent extends TodosEvent{}
