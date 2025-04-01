import 'package:modu_3_dart_study/2025-04-01/repository/todo_repository.dart';
import '../data_source/todo_data_source.dart';
import '../model/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final todoList = await dataSource.getAllTodos();
    return todoList
        .map((json) => Todo.fromJson(json))
        .toList();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final todoList = await getTodos();
    return todoList
        .where((todo) => todo.completed)
        .toList();
  }
}