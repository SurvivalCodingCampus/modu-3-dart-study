import 'package:modu_3_dart_study/2025-04-03/solution3/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> addTodo({required Map<String, dynamic> json});

  Future<List<Todo>> deleteTodo({required Map<String, dynamic> json});
}
