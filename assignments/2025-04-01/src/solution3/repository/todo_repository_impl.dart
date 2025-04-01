import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/model/todo.dart';
import 'package:modu_3_dart_study/2025-04-01/solution3/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {

  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final todoList = await _todoDataSource.getTodos();
    return todoList
        .map((e) => Todo.fromJson(e))
        .where((e) => e.completed == true)
        .toList();
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todoList = await _todoDataSource.getTodos();
    return todoList
        .map((e) => Todo.fromJson(e))
        .toList();
  }
}