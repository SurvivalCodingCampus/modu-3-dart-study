import 'package:modu_3_dart_study/2025-04/2025-04-03/model/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> findAll();
  Future<Todo> findOne(int id);
}
