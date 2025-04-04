import '../model/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodo(int id);

  Future<List<Map<String, dynamic>>> readTodos();
  Future<void> writeTodos(List<Map<String, dynamic>> todos);
}
