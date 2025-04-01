import 'package:modu_3_dart_study/2025-03/2025-03-31/models/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo(String relativePath);
  Future<List<Todo>> getTodos(String relativePath);
}
