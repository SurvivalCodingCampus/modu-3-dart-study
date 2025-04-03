import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/todo/model/todo.dart';

abstract interface class TodoRepository {
  Future<Todo> getTodo(int id);
  Future<List<Todo>> getTodos();
}