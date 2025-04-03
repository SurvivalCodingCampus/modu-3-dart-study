import '../../2025-04-01/model/todo.dart';
import '../data_source/todo_data_source.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<List<Todo>> fetchTodos() => dataSource.getTodos();

  @override
  Future<Todo> fetchTodoById(int id) => dataSource.getTodo(id);
}
