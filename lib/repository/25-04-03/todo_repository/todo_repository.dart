import '../../../model/25-04-03/todo.dart';

abstract interface class TodoRepository {
  Future<Todo> getTodoId(int id);
  Future<List<Todo>> getTodoList();
}
