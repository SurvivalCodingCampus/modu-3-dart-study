import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  const TodoRepositoryImpl({required TodoDataSource dataSource})
    : _dataSource = dataSource;
  @override
  Future<List<Todo>> getCompletedTodos() async {
    List<Map<String, dynamic>> jsonMap = await _dataSource.getAllTodos();
    List<Todo> completedTodos =
        jsonMap
            .map((e) => Todo.fromJson(e))
            .where((element) => element.completed == true)
            .toList();
    return completedTodos;
  }

  @override
  Future<List<Todo>> getTodos() async {
    List<Map<String, dynamic>> jsonMap = await _dataSource.getAllTodos();
    List<Todo> allTodos = jsonMap.map((e) => Todo.fromJson(e)).toList();
    return allTodos;
  }
}
