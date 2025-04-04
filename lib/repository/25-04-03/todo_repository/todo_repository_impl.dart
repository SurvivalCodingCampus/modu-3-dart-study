import 'package:modu_3_dart_study/repository/25-04-03/todo_repository/todo_repository.dart';

import '../../../data_source/25-04-03/todo_data_source/todo_data_source.dart';
import '../../../model/25-04-03/todo.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<Todo> getTodoId(int id) async {
    return await dataSource.getTodo(id);
  }

  @override
  Future<List<Todo>> getTodoList() async {
    return await dataSource.getTodos();
  }
}
