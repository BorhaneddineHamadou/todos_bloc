import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todosproject/api/todos_api.dart';

import '../models/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(LoadingState()) {
    on<TodosEvent>((event, emit) async{
      if(event is GetAllTodosEvent){
        emit(LoadingState());
        try{
          final todos = await TodosAPI.getAllTodos();
          emit(LoadedState(todos));
        }catch(e){
          emit(ErrorState("Something went wrong, please try again later"));
        }
      }
    });
  }
}
