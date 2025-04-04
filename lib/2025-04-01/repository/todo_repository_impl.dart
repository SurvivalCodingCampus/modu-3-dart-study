import '../data_source/local/todo_data_source_impl.dart';
import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl({TodoDataSource? todoDataSource})
    : _todoDataSource = todoDataSource ?? TodoDataSourceImpl();

  @override
  Future<List<Todo>> getTodos() async {
    const path = 'assignment/2025-04-01/assets/todos.json';
    final json = await _todoDataSource.fetchTodos(path);
    return json.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    const path = 'assignment/2025-04-01/assets/todos.json';
    final json = await _todoDataSource.fetchTodos(path);
    return json
        .map((e) => Todo.fromJson(e))
        .where((e) => e.completed == true)
        .toList();
  }
}
