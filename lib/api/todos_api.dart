import 'dart:convert';

import 'package:http/http.dart';
import 'package:todosproject/models/todo.dart';

class TodosAPI{
  static Future<List<Todo>> getAllTodos() async{
    try{
      String url = "https://jsonplaceholder.typicode.com/todos";
      var response = await get(Uri.parse(url));
      List<Todo> todos = (jsonDecode(response.body))
          .map<Todo>((jsonTodo) => Todo.fromJson(jsonTodo))
          .toList();
      return todos;
    }catch(e){
      rethrow;
    }
  }
}