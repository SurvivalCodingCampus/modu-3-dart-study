import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../../../../2025-04-01/src/solution/model/todo.dart';
import '../data_source/todo_data_source.dart';
import '../data_source/todo_data_source_impl.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl({required TodoDataSource todoDataSource})
    : _todoDataSource = todoDataSource;

  @override
  Future<Todo> getTodo(int id) async {
    final response = await _todoDataSource.getTodo(id);
    return Todo.fromJson(response);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final response = await _todoDataSource.getTodos();
    return response.map((e) => Todo.fromJson(e)).toList();
  }
}

void main() async {
  final client = MockClient((request) async {
    if (request.url.toString() ==
        "https://jsonplaceholder.typicode.com/todos") {
      return http.Response(
        jsonEncode([
          {
            "userId": 1,
            "id": 1,
            "title": "delectus aut autem",
            "completed": false,
          },
          {
            "userId": 1,
            "id": 2,
            "title": "quis ut nam facilis et officia qui",
            "completed": false,
          },
        ]),
        200,
      );
    } else if (request.url.toString() ==
        "https://jsonplaceholder.typicode.com/todos/1") {
      return http.Response(
        jsonEncode({
          "userId": 1,
          "id": 1,
          "title": "delectus aut autem",
          "completed": false,
        }),
        200,
      );
    }
    return http.Response('Not found', 404);
  });
  final repository = TodoRepositoryImpl(
    todoDataSource: TodoDataSourceImpl(
      client: client,
      url: 'https://jsonplaceholder.typicode.com/todos',
    ),
  );

  // final todos = await repository.getTodos();
  // print(todos);
  final todo = await repository.getTodo(2);
  print(todo);
}
