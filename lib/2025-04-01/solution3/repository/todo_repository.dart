import 'package:modu_3_dart_study/2025-04-01/solution3/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<List<Todo>> getCompletedTodos();
}