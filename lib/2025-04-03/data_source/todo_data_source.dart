import '../../2025-04-01/model/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Map<String, dynamic>>> getTodos();

  Future<Map<String, dynamic>> getTodo(int id);
}