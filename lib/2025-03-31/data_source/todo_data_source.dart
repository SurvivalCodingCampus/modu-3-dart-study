import '../model/todo.dart';

// 1번 문제

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}

// 2번 문제

// abstract interface class TodoDataSource {
//   Future<List<Todo>> getTodos();
// }

