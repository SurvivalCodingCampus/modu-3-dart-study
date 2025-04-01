import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/repository/todo_repository_impl.dart';
import 'package:test/test.dart';

import '../mock/mock_todo_data_source_impl.dart';

void main() {
  test('모든 Todo 가져오기', () async {
    final TodoRepository todoRepository = TodoRepositoryImpl(TodoDataSourceImpl());
    final todoList = await todoRepository.getTodos();

    expect(todoList.length, 200);
  });
  test('completed 된 Todo 찾기', () async {
    final TodoRepository todoRepository = TodoRepositoryImpl(TodoDataSourceImpl());
    final todoList = await todoRepository.getCompletedTodos();

    expect(todoList.any((e) => e.completed == false), isFalse, reason: 'completed가 false인게 있으면 안됨.');
  });
  test('Mock 데이터로 모든 Todo 가져오기', () async {
    final TodoRepository todoRepository = TodoRepositoryImpl(MockTodoDataSourceImpl());
    final todoList = await todoRepository.getTodos();

    expect(todoList.length, 2);
  });
  test('Mock 데이터로 completed 된 Todo 찾기', () async {
    final TodoRepository todoRepository = TodoRepositoryImpl(MockTodoDataSourceImpl());
    final todoList = await todoRepository.getCompletedTodos();

    expect(todoList.any((e) => e.completed == false), isFalse, reason: 'completed가 false인게 있으면 안됨.');
  });
}
