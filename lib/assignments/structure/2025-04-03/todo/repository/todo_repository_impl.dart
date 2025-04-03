
import 'package:modu_3_dart_study/assignments/structure/2025-04-03/todo/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/assignments/structure/2025-04-03/todo/model/todo.dart';
import 'package:modu_3_dart_study/assignments/structure/2025-04-03/todo/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<Todo> getTodo(int id) async {
    final map = await _dataSource.getTodo(id);
    return Todo.fromJson(map);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final mapList = await _dataSource.getTodos();
    return mapList.map((e) => Todo.fromJson(e)).toList();
  }
}