

import '../../todos_project/model/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();
}

