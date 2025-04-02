import 'dart:io';

import '../data_source/data_source.dart';

import '../data_source/mock/mock_todo_data_source_impl.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final DataSource _todoDataSource;
  const TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final filePath =
          '${Directory.current.path}/assignments/2025-04-01/todos.json';
      List<dynamic> jsonList = await _todoDataSource.getList(filePath);

      return jsonList.map((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      print('예상치 못한 오류 발생: $e');
      return [];
    }
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final filePath =
          '${Directory.current.path}/assignments/2025-04-01/todos.json';
      List<dynamic> jsonList = await _todoDataSource.getList(filePath);

      return jsonList
          .map((json) => Todo.fromJson(json))
          .where((e) => e.completed == true)
          .toList();
    } catch (e) {
      print('예상치 못한 오류 발생: $e');
      return [];
    }
  }
}

void main() async {
  final mockTodosDataSource = MockTodoDataSourceImpl();
  final todoRepository = TodoRepositoryImpl(mockTodosDataSource);

  List<Todo> todos = await todoRepository.getTodos();

  List<Todo> completeTodos = await todoRepository.getCompletedTodos();

  print(todos);
  print(completeTodos);
}
