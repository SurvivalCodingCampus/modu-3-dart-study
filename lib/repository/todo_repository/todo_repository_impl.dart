import 'package:modu_3_dart_study/model/todo.dart';
import 'package:modu_3_dart_study/repository/todo_repository/todo_repository.dart';

import '../../data_source/todo_data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;
  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final allTodos = await dataSource.getTodos();
    return allTodos.where((todo) => todo.completed == true).toList();
  }

  @override
  Future<List<Todo>> getTodos() async {
    final allTodos = await dataSource.getTodos();
    return allTodos;
  }
}
