import '../../2025-04-01/model/todo.dart';
import '../data_source/todo_data_source.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl({required TodoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Todo>> fetchTodos() => _dataSource.getTodos();

  @override
  Future<Todo> fetchTodoById(int id) => _dataSource.getTodo(id);
}
