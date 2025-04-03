import 'package:modu_3_dart_study/2025-04/2025-04-03/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-03/repository/todo_repository.dart';

import '../model/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _source;

  const TodoRepositoryImpl(this._source);

  @override
  Future<List<Todo>> findAll() async {
    return await _source.getTodos();
  }

  @override
  Future<Todo> findOne(int id) async {
    return await _source.getTodo(id);
  }
}
