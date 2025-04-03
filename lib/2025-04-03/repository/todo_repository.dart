import '../../2025-04-01/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> fetchTodos();

  Future<Todo> fetchTodoById(int id);
}
