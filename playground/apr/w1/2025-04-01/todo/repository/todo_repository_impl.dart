import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    final todoData = await _todoDataSource.getTodos();

    return todoData.map((e) => Todo.fromJson(e)).toList();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final todoData = await _todoDataSource.getTodos();
    final todoCompletedData = todoData.where((e) => e['completed'] == true)
        .toList();

    return todoCompletedData.map((e) => Todo.fromJson(e)).toList();
  }
}
