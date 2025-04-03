import '../model/todo.dart';

abstract interface class TodoRepository {
  Future<Todo> getTodo(int id);
  Future<List<Todo>> getTodos();
}