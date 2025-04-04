import '../data_source/todo_data_source.dart';
import '../model/todo.dart';

import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final List jsonList = await _todoDataSource.getTodos();

    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<Todo> getTodo(int id) async {
    final jsonMap = await _todoDataSource.getTodo(id);

    return Todo.fromJson(jsonMap);
  }
}
