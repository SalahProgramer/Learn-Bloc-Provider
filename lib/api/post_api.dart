import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learnblocprovider/models/post.dart';

import '../models/todo.dart';

class TodoApi {
  static const String url = "https://jsonplaceholder.typicode.com/todos";
  static const String url2 = "https://jsonplaceholder.typicode.com/posts";

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
  Future<List<Post>> getAllPosts({int startIndex=0,int limit=20}) async {

    try {
      var response = await http.get(Uri.parse("$url2?_start=$startIndex&_limit=$limit"));
      List<Post> posts = (json.decode(response.body))
          .map<Post>((json) => Todo.fromJson(json))
          .toList();
      return posts;
    } catch (error) {
      rethrow;
    }
  }
}
