import 'package:modu_3_dart_study/2025-04-03/model/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();
  Future<Todo> getTodo(int id);
}