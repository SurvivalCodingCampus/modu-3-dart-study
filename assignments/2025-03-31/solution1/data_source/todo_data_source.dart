import 'package:modu_3_dart_study/2025-03-31/solution1/model/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}
