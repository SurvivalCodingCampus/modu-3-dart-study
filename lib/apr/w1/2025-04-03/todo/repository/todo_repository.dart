import '../Model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(int id);
}
