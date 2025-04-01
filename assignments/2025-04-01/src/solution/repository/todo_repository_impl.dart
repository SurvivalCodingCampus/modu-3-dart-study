import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl({required TodoDataSource todoDataSource})
    : _todoDataSource = todoDataSource;

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final todos = await _todoDataSource.getTodos();

    return todos
        .map((e) => Todo.fromJson(e))
        .where((e) => e.completed)
        .toList();
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await _todoDataSource.getTodos();

    return todos.map((e) => Todo.fromJson(e)).toList();
  }
}
