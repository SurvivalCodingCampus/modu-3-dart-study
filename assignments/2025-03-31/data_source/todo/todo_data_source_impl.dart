import '../../model/todo/todo_model.dart';
import '../base/base_data_source.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl extends BaseDataSource implements TodoDataSource {
  @override
  String get path => 'assignments/2025-03-31/data/todo.json';

  TodoDataSourceImpl();

  @override
  Future<Todo> fetchTodo() async {
    final jsonData = super.fetchJson();
    final todo = Todo.fromJson(jsonData);
    await fetchDelay();
    return todo;
  }
}
