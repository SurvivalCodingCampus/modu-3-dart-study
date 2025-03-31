import '../../model/todo/todo_list_model.dart';
import '../../model/todo/todo_model.dart';
import '../base/base_data_source.dart';
import 'todo_list_data_source.dart';

class TodoListDataSourceImpl extends BaseDataSource
    implements TodoListDataSource {
  @override
  String get path => 'assignments/2025-03-31/data/todo_list.json';

  TodoListDataSourceImpl();

  @override
  Future<List<Todo>> fetchTodoList() async {
    final jsonData = super.fetchJson();
    final todoList = TodoList.fromJson(jsonData);
    await fetchDelay();
    return todoList.list;
  }
}
