import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/model/todo.dart';

import '../data_source/todo_data_source.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl({required TodoDataSource todoDataSource})
    : _todoDataSource = todoDataSource;

  @override
  Future<Todo> getTodo(int id) async {
    final response = await _todoDataSource.getTodo(id);
    return Todo.fromJson(response);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final response = await _todoDataSource.getTodos();
    return response.map((e) => Todo.fromJson(e)).toList();
  }
}
