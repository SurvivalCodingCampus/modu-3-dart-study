import 'package:modu_3_dart_study/model/25-04-01/todo.dart';
import 'package:modu_3_dart_study/repository/25-04-01/todo_repository/todo_repository.dart';

import '../../../data_source/25-04-01/todo_data_source/todo_data_source.dart';

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
