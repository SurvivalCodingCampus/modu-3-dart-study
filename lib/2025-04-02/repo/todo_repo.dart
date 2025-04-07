import '../model/todo.dart';

abstract interface class TodoRepo {
  Future<List<Todo>> getTodos();
  Future<void> addTodo(String title);
  Future<void> updateTodo(int id, String newTitle);
  Future<void> toggleTodo(int id);
  Future<void> deleteTodo(int id);
}
