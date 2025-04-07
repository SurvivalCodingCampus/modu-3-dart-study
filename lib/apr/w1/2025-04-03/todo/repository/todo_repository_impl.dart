import 'package:modu_3_dart_study/apr/w1/2025-04-03/todo/Model/todo.dart';
import 'package:modu_3_dart_study/apr/w1/2025-04-03/todo/repository/todo_repository.dart';

import '../data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<Todo> getTodo(int id) {
    return _todoDataSource.getTodo(id);
  }

  @override
  Future<List<Todo>> getTodos() {
    return _todoDataSource.getTodos();
  }
}
