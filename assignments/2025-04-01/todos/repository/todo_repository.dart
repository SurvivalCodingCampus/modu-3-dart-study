import '../model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getCompletedTodos();
}
