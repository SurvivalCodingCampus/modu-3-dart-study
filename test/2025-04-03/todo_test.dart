import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../assignments/2025-04-03/todo/data_source/todo_data_source.dart';
import '../../assignments/2025-04-03/todo/data_source/todo_data_source_impl.dart';
import '../../assignments/2025-04-03/todo/repository/todo_repository.dart';
import '../../assignments/2025-04-03/todo/repository/todo_repository_impl.dart';

void main() {
  group('Todo test', () {
    test('fetchTodos() test', () async {
      final mockClient = MockClient((request) async {
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
      final TodoDataSource todoDataSource = TodoDataSourceImpl(
        client: mockClient,
      );
      final TodoRepository todoRepository = TodoRepositoryImpl(
        dataSource: todoDataSource,
      );
      try {
        final result = await todoRepository.fetchTodos();
        expect(result.first.id, 1);
        expect(result.first.title, 'Todo 1');
        expect(result.first.completed, false);
      } catch (e) {
        throw Exception(e);
      }
    });
    test('fetchTodo(int i) test', () async {
      final mockClient = MockClient((request) async {
        final String testUrl = 'https://jsonplaceholder.typicode.com/todos/1';
        final String testJson =
            await File(
              'assignments/2025-04-03/todo/data/todo.json',
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
      final TodoDataSource todoDataSource = TodoDataSourceImpl(
        client: mockClient,
      );
      final TodoRepository todoRepository = TodoRepositoryImpl(
        dataSource: todoDataSource,
      );
      try {
        final result = await todoRepository.fetchTodo(1);
        expect(result.id, 1);
        expect(result.title, 'Todo 1');
        expect(result.completed, false);
        expect(() => todoRepository.fetchTodo(999), throwsException);
      } catch (e) {
        throw Exception(e);
      }
    });
    test('서버 오류 발생 시 적절한 예외 발생', () async {
      final mockClient = MockClient((request) async {
        return http.Response('Internal Server Error', 500);
      });

      TodoDataSource todoDataSource = TodoDataSourceImpl(client: mockClient);
      TodoRepository todoRepository = TodoRepositoryImpl(
        dataSource: todoDataSource,
      );

      expect(() => todoRepository.fetchTodos(), throwsException);
    });
  });
}
