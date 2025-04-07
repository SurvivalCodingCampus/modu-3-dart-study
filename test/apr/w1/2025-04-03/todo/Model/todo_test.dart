import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/todo/Model/todo.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/todo/data_source/todo_data_source-impl.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/todo/repository/todo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('getTodos 성공', () async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos') {
        return http.Response(
          json.encode([
            {"id": 1, "title": "Todo 1", "completed": false},
            {"id": 2, "title": "Todo 2", "completed": true},
          ]),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final dataSource = TodoDataSourceImpl(client);
    final repository = TodoRepositoryImpl(dataSource);

    final todos = await repository.getTodos();

    expect(todos, isA<List<Todo>>());
    expect(todos.length, equals(2));
  });
  test('getTodo 성공', () async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos/1') {
        return http.Response(
          json.encode({"id": 1, "title": "Todo 1", "completed": false}),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final dataSource = TodoDataSourceImpl(client);
    final repository = TodoRepositoryImpl(dataSource);

    final todo = await repository.getTodo(1);

    expect(todo.title, equals('Todo 1'));
    expect(todo.completed, equals(false));
  });
  test('네트워크 에러 케이스', () async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todo/1') {
        return http.Response(
          json.encode({"id": 1, "title": "Todo 1", "completed": false}),
          200,
        );
      }
      return http.Response('Network Error', 500);
    });

    final dataSource = TodoDataSourceImpl(client);
    final repository = TodoRepositoryImpl(dataSource);

    expect(() async => await repository.getTodo(1), throwsException);
  });
  test('getTodo 없는 아이디', () async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos/1') {
        return http.Response(
          json.encode({"id": 1, "title": "Todo 1", "completed": false}),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final dataSource = TodoDataSourceImpl(client);
    final repository = TodoRepositoryImpl(dataSource);

    expect(() async => await repository.getTodo(2), throwsException);
  });
}
