import '../../model/todo.dart';
import '../todo_repository.dart';

class MockTodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<Todo>> getTodos() async {
    return [
      Todo(userId: 1, id: 1, title: 'title', completed: true),
      Todo(userId: 1, id: 1, title: 'title', completed: true),
      Todo(userId: 1, id: 1, title: 'title', completed: false),
      Todo(userId: 1, id: 1, title: 'title', completed: false),
      Todo(userId: 1, id: 1, title: 'title', completed: false),
      Todo(userId: 1, id: 1, title: 'title', completed: true),
    ];
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final todos = await getTodos();
    final completedTodos = todos.where((e) => e.completed).toList();
    return completedTodos;
  }
}