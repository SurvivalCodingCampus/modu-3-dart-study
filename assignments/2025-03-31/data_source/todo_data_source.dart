import '../model/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodoFromFile(String fileName);
  Future<List<Todo>> getTodosFromFile(String listFileName);
}
