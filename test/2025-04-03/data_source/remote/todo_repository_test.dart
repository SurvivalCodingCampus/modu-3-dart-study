import 'package:modu_3_dart_study/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04-03/config/api_config.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/remote/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

import '../../network/mock_http_client_impl.dart';

void main() {
  group('Mock을 활용한 TodoRepository 테스트', () {
    const List<Map<String, dynamic>> todosBody = [
      {'id': 1, 'title': 'Test Todo 1', 'completed': false},
      {'id': 2, 'title': 'Test Todo 2', 'completed': true},
    ];

    const todoBody = {'id': 1, 'title': 'Test Todo 1', 'completed': false};

    MockHttpClientImpl mockHttpClient;
    TodoDataSource todoDataSource;
    TodoRepository repository;

    test('Todos가 정상적으로 반환되어야 한다.', () async {
      // given
      final todosUrlString = ApiConfig.todosUrlString;

      mockHttpClient = MockHttpClientImpl(urlString: todosUrlString, body: todosBody);

      todoDataSource = TodoDataSourceImpl(
        client: mockHttpClient.mockClient,
      );

      repository = TodoRepositoryImpl(
        todoDataSource: todoDataSource,
      );

      // when
      final todos = await repository.getTodos();

      final jsonList = todosBody;
      final anotherTodos = jsonList.map((e) => Todo.fromJson(e)).toList();

      // then
      expect(todos.length, equals(anotherTodos.length));

      if (todos.isNotEmpty) {
        expect(todos.first.userId, anotherTodos.first.userId);
      }
    });

    test('Todo가 정상적으로 반환되어야 한다.', () async {
      // given
      const id = 1;
      final todoUrlString = ApiConfig.todoUrlString(id);

      mockHttpClient = MockHttpClientImpl(urlString: todoUrlString, body: todoBody);

      todoDataSource = TodoDataSourceImpl(
        client: mockHttpClient.mockClient,
      );

      repository = TodoRepositoryImpl(
        todoDataSource: todoDataSource,
      );

      // when
      final todo = await repository.getTodo(id);

      final anotherTodo = Todo.fromJson(todoBody);

      // then
      expect(todo.userId, equals(anotherTodo.userId));
    });
  });
}
