import 'package:modu_3_dart_study/2025-04-03/repositroy/todo_respository.dart';

import '../model/todo.dart';
import '../data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return await dataSource.getTodos();
  }

  @override
  Future<Todo> getTodo(int id) async {
    return await dataSource.getTodo(id);
  }
}