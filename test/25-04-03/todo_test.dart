import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/data_source/25-04-03/todo_data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/model/25-04-03/todo.dart';
import 'package:modu_3_dart_study/repository/25-04-03/todo_repository/todo_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() async {
  group('data_test', () {
    late TodoRepositoryImpl repository;
    late TodoDataSourceImpl dataSource;
    setUp(() {
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
        } else if (request.url.toString() ==
            'https://jsonplaceholder.typicode.com/todos/1') {
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
      final datsSource = TodoDataSourceImpl(client: client);
      repository = TodoRepositoryImpl(dataSource: datsSource);
    });
    test('getTodos Test', () async {
      final todos = await repository.getTodoList();
      expect(todos.length, 2);
      expect(todos[0].id, 1);
      expect(todos[0].title, 'Todo 1');
      expect(todos[0].completed, false);
    });
    test('getTodo Test', () async {
      final todo = await repository.getTodoId(1);
      expect(todo.id, 1);
      expect(todo.title, 'Todo 1');
      expect(todo.completed, false);
    });
    test('존재하지 않는 id', () async {
      final todo2 = repository.getTodoId(3);
      expect(todo2, throwsException);
    });
  });
}
