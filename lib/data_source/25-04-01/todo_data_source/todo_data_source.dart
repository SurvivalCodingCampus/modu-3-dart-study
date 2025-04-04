import '../../../model/25-04-01/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();
}
