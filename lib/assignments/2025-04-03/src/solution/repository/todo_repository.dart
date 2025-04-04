import 'package:modu_3_dart_study/assignments/2025-04-03/src/solution/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<Todo> getTodo(int id);
}
