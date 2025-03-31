import '../../model/todo/todo_model.dart';

abstract interface class TodoListDataSource {
  Future<List<Todo>> fetchTodoList();
}
