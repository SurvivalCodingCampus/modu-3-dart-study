import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl(this._dataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final resp = await _dataSource.getTodos();
    final todos = resp.map((e) => Todo.fromJson(e)).toList();
    return todos;
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final todos = await getTodos();
    final completedTodos = todos.where((e) => e.completed).toList();
    return completedTodos;
  }
}
