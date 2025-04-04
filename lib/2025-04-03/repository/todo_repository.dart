import '../../2025-03-31/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(int id);
}
