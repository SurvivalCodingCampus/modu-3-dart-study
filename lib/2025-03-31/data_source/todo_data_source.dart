import '../model/todo.dart';
import '../model/user.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
  Future<List<Todo>> getTodos();
  Future<List<User>> getUsers();
}