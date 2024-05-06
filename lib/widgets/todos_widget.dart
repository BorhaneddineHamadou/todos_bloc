import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todosproject/bloc/todos_bloc.dart';

import '../models/todo.dart';

class TodosWidget extends StatelessWidget {
  final List<Todo> todos;

  const TodosWidget({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(todos[index].id.toString()),
                  ),
                  title: Text(todos[index].title),
                  trailing: todos[index].completed
                      ? const Icon(Icons.done, color: Colors.green)
                      : null,
                ),
              );
            }
        ),
        onRefresh: () async{
          context.read<TodosBloc>().add(GetAllTodosEvent());
        },
    );
  }

}