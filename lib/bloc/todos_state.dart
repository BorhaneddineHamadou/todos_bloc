part of 'todos_bloc.dart';

@immutable
abstract class TodosState extends Equatable{
  @override
  List<Object?> get props => [];
}

class LoadingState extends TodosState {}

class LoadedState extends TodosState{
  final List<Todo> todos;

  LoadedState(this.todos);
  @override
  List<Object?> get props => [todos];
}

class ErrorState extends TodosState{
  final String message;

  ErrorState(this.message);
  @override
  List<Object?> get props => [message];
}