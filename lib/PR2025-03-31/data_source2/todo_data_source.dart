import 'package:modu_3_dart_study/PR2025-03-31/model/todos.dart';

abstract interface class TodoDataSource {
  Future<List<Todos>> getTodos();
}
