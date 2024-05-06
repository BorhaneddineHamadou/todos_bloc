import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosproject/bloc/todos_bloc.dart';
import 'package:todosproject/widgets/loading_widget.dart';
import 'package:todosproject/widgets/my_error_widget.dart';
import 'package:todosproject/widgets/todos_widget.dart';

class TodosScreen extends StatelessWidget{

  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state){
          if(state is LoadedState){
            return TodosWidget(todos: state.todos);
          }else if(state is ErrorState){
            return MyErrorWidget(message: state.message);
          }else{
            return const LoadingWidget();
          }
        },
      ),
    );
  }

}