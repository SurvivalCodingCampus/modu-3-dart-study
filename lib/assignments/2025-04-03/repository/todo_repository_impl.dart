import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<Todo> getTodo(int id) async {
    final Map<String, dynamic> json = await _todoDataSource.getTodo(id);

    return Todo.fromJson(json);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final List<Map<String, dynamic>> todos = await _todoDataSource.getTodos();

    return todos.map((e) => Todo.fromJson(e)).toList();
  }
}
