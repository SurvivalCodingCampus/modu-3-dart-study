import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/model/todo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

final client = MockClient((request) async {
  if (request.url.toString() == "https://jsonplaceholder.typicode.com/todos") {
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

void main() {
  group('Todo Repository Test', () {
    test('Todos 조회', () async {
      final expected = [
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
      ];
      final repository = TodoRepositoryImpl(
        todoDataSource: TodoDataSourceImpl(
          client: client,
          url: 'https://jsonplaceholder.typicode.com/todos',
        ),
      );

      final todos = await repository.getTodos();

      expect(todos, isA<List<Todo>>());
      expect(todos.length, 2);
      for (int i = 0; i < expected.length; i++) {
        expect(todos[i].userId, expected[i]['userId']);
        expect(todos[i].id, expected[i]['id']);
        expect(todos[i].title, expected[i]['title']);
        expect(todos[i].completed, expected[i]['completed']);
      }
    });

    test('Todo 조회', () async {
      final expected = {
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false,
      };
      final repository = TodoRepositoryImpl(
        todoDataSource: TodoDataSourceImpl(
          client: client,
          url: 'https://jsonplaceholder.typicode.com/todos',
        ),
      );

      final todo = await repository.getTodo(1);

      expect(todo, isA<Todo>());
      expect(todo.id, expected['id']);
      expect(todo.userId, expected['userId']);
      expect(todo.title, expected['title']);
      expect(todo.completed, expected['completed']);
    });

    test('Todo 조회 - id 미존재', () async {
      final repository = TodoRepositoryImpl(
        todoDataSource: TodoDataSourceImpl(
          client: client,
          url: 'https://jsonplaceholder.typicode.com/todos',
        ),
      );

      expect(() async => await repository.getTodo(2), throwsException);
    });

    test('네트워크 에러', () async {
      final repository = TodoRepositoryImpl(
        todoDataSource: TodoDataSourceImpl(
          client: client,
          url: 'https://test.com/todos',
        ),
      );

      expect(() async => await repository.getTodos(), throwsException);
    });
  });
}
