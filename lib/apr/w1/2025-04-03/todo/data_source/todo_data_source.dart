import '../Model/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(int id);
}
