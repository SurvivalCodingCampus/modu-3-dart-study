import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../../assignments/2025-04-01/todo/model/todo.dart';
import '../../../assignments/2025-04-01/todo/repository/impl/todo_repository_impl.dart';
import '../../../assignments/2025-04-01/todo/repository/todo_repository.dart';
import '../mock/mock_todo_data_source.dart';

void main() {
  late MockClient client;
  late TodoRepository todoRespository;

  group('투두 : ', () {
    setUp(() {
      client = MockClient((request) async {
        if (request.url.toString() == MockTodoDataSource.todoListUrl) {
          return http.Response.bytes(
            utf8.encode(
              jsonEncode([
                {"id": 1, "title": "Todo 1", "completed": false},
                {"id": 2, "title": "Todo 2", "completed": true},
              ]),
            ),
            200,
          );
        } else if (request.url.toString() == MockTodoDataSource.todoOneUrl) {
          return http.Response.bytes(
            utf8.encode(
              jsonEncode({"id": 1, "title": "Todo 1", "completed": false}),
            ),
            200,
          );
        } else {
          return http.Response(jsonEncode([]), 404);
        }
      });

      todoRespository = TodoRepositoryImpl(MockTodoDataSource(client), Todo());
    });
    test('조회', () async {
      final List<Todo> todos = await todoRespository.getItems('');

      expect(todos.length, 2);
    });
    test('단일 조회', () async {
      final Todo todo = await todoRespository.getItem(1);

      expect(todo.id, 1);
      expect(todo.title, 'Todo 1');
      expect(todo.completed, false);
    });
  });
}
