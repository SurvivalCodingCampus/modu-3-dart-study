import '../../../model/25-04-03/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodo(int id);
}
