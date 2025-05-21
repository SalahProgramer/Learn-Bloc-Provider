part of 'todos_bloc.dart';

@immutable
sealed class TodosState extends Equatable {}

class LoadingState extends TodosState{
  @override
  // TODO: implement props
  List<Object?> get props => [];



}

class CompletedState extends TodosState{
final List<Todo> todos;
  CompletedState({required this.todos});

  @override
  // TODO: implement props
  List<Object?> get props => [todos];
}

class ErrorsState extends TodosState{
  final String message;

  ErrorsState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];


}

