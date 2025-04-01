import '../data_source/todo_datasource.dart';
import '../model/todo.dart';
import 'interface/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatasource _datasource;

  TodoRepositoryImpl(this._datasource);

  @override
  Future<List<Todo>> getTodos() async {
    final raw = await _datasource.fetchTodos();
    return raw.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final raw = await _datasource.fetchTodos();
    return raw
        .map((e) => Todo.fromJson(e))
        .where((todo) => todo.completed)
        .toList();
  }
}
