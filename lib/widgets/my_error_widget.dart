import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosproject/bloc/todos_bloc.dart';

class MyErrorWidget extends StatelessWidget{
  final String message;

  const MyErrorWidget({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Text(
                message,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
          ),
          ElevatedButton(
              onPressed: (){
                context.read<TodosBloc>().add(GetAllTodosEvent());
              },
              child: const Text("Try Again"),
          ),
        ],
      ),
    );
  }

}