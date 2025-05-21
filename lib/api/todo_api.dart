import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/todo.dart';

class TodoApi {
  static const String url = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Todo>> getAllTodos() async {
    try {
      var response = await http.get(Uri.parse(url));
      List<Todo> todos = (json.decode(response.body))
          .map<Todo>((json) => Todo.fromJson(json))
          .toList();
      return todos;
    } catch (error) {
      rethrow;
    }
  }
}
