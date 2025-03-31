import '../../model/todo/todo_model.dart';

abstract interface class TodoDataSource {
  Future<Todo> fetchTodo();
}
