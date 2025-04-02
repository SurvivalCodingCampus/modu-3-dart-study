import '../../model/todo/todo_list_model.dart';
import '../../model/todo/todo_model.dart';
import '../base/base_data_source.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl extends BaseDataSource implements TodoDataSource {
  @override
  String get basePath => 'assignments/2025-03-31/data/';

  TodoDataSourceImpl();

  @override
  Future<Todo> fetchTodo() async {
    final jsonData = fetchJson('todo.json');
    final todo = Todo.fromJson(jsonData);
    await fetchDelay();
    return todo;
  }

  @override
  Future<List<Todo>> fetchTodos() async {
    final jsonData = fetchJson('todo_list.json');
    final todoList = TodoList.fromJson(jsonData);
    await fetchDelay();
    return todoList.list;
  }
}
