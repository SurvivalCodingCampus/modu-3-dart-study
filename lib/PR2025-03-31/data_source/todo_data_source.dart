import 'package:modu_3_dart_study/PR2025-03-31/model/todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}
