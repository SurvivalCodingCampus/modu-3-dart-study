import 'package:modu_3_dart_study/PR2025-04-01/todos/model/todo.dart';
import 'package:modu_3_dart_study/PR2025-04-01/todos/repository/todo_repository.dart';
import 'package:modu_3_dart_study/PR2025-04-01/todos/data_source/todo_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoDataSource todoDataSource = TodoDataSource();

  @override
  Future<List<Todo>> getCompletedTodos() async {
    List<Todo> allTodos = await todoDataSource.getTodos();
    List<Todo> completedTodos =
        allTodos.where((e) => e.completed == true).toList();
    return completedTodos;
  }
}
