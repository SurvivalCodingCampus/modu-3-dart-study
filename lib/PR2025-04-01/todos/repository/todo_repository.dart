import 'package:modu_3_dart_study/PR2025-04-01/todos/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getCompletedTodos();
}
