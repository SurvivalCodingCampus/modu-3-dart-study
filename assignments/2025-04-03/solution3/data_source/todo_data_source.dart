import 'package:modu_3_dart_study/2025-04-03/solution3/model/todo.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos({required String url});

  Future<Todo?> getTodo({
    required String url,
    required int userId,
    required int id,
  });
}
