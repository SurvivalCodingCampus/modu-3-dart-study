import 'todo.dart';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}
