import 'package:http/testing.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/mock_http_client_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/model/todo.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';


void main() {
  const String mockUrl = 'https://jsonplaceholder.typicode.com/todos';

  test('getTodo 테스트', () async {
    final TodoRepository todoRepository = TodoRepositoryImpl(
        dataSource: TodoDataSourceImpl(url: mockUrl, client: MockHttpClientImpl().createTodoMockClient(mockUrl))
    );
    final Todo todo = await todoRepository.getTodo(1);
    expect(todo.id, 1);
    expect(todo.title, 'Test Todo 1');
    expect(todo.completed, false);
  });

  test('getTodos 테스트', () async {
    final TodoRepository todoRepository = TodoRepositoryImpl(
        dataSource: TodoDataSourceImpl(url: mockUrl, client: MockHttpClientImpl().createTodoMockClient(mockUrl))
    );
    final List<Todo> todos = await todoRepository.getTodos();
    expect(todos.length, 2);
  });
}
