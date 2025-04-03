import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'todo/data_source/todo_data_source.dart';
import 'todo/data_source/todo_data_source_impl.dart';
import 'todo/repository/todo_repository.dart';
import 'todo/repository/todo_repository_impl.dart';

void main(List<String> args) async {
  final mockClient1 = MockClient((request) async {
    final String testUrl = 'https://jsonplaceholder.typicode.com/todos';
    final String testJson =
        await File(
          'assignments/2025-04-03/todo/data/todos.json',
        ).readAsString();
    if (request.url.toString() == testUrl) {
      final response = http.Response.bytes(
        utf8.encode(testJson),
        200,
        headers: {'Content-Type': 'application/json; charset=utf-8'},
      );

      return response;
    }
    return http.Response('Not Found', 404);
  });
  final TodoDataSource todoDataSource1 = TodoDataSourceImpl(
    client: mockClient1,
  );
  final TodoRepository todoRepository1 = TodoRepositoryImpl(
    dataSource: todoDataSource1,
  );
  final result1 = await todoRepository1.fetchTodos();
  print(result1);
}
