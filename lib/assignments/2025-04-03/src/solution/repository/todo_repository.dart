import '../../../../2025-04-01/src/solution/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(int id);
}
