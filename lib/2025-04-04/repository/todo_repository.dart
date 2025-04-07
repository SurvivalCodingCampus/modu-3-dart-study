import 'package:modu_3_dart_study/2025-04-04/model/todo.dart';

abstract interface class TodoRepository {
  Future<Todo> getTodo(int id);
  Future<List<Todo>> getTodos();
}
