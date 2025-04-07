import '../../../2025-04-03/solution3/model/todo.dart';
import '../../../2025-04-03/solution3/data_source/todo_data_source.dart';
import '../../../2025-04-03/solution3/data_source/todo_data_source_impl.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource todoDataSource = TodoDataSourceImpl();

  @override
  Future<List<Todo>> addTodo({required Map<String, dynamic> json}) async {
    final List<Todo> todoList = await todoDataSource.getTodos(
      url: 'https://jsonplaceholder.typicode.com/todos',
    );

    final List<Todo> newTodo = todoList..add(Todo.fromJson(json));

    return newTodo;
  }

  @override
  Future<List<Todo>> deleteTodo({required Map<String, dynamic> json}) async {
    final List<Todo> todoList = await todoDataSource.getTodos(
      url: 'https://jsonplaceholder.typicode.com/todos',
    );

    final List<Todo> newTodo =
        todoList
            .where(
              (items) =>
                  json["id"] != items.id && json["userId"] != items.userId,
            )
            .toList();

    return newTodo;
  }
}
