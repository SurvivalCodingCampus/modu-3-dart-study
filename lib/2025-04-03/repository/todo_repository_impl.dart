import 'package:modu_3_dart_study/2025-04-03/model/todo.dart';
import 'package:modu_3_dart_study/2025-04-03/repository/todo_repository.dart';

import '../data_source/todo_data_source.dart';


class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  const TodoRepositoryImpl({
    required TodoDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<Todo> getTodo(int id) async {
    return _dataSource.getTodo(id);
  }

  @override
  Future<List<Todo>> getTodos() async {
    return _dataSource.getTodos();
  }
}