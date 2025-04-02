import 'package:modu_3_dart_study/2025-04/2025-04-01/model/todo.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';
import 'package:modu_3_dart_study/2025-04/repository.dart';

class TodoRepository implements Repository<Todo, int> {
  final DataSource<Todo> _source;

  const TodoRepository(this._source);

  @override
  Future<List<Todo>> findAll() async {
    return await _source.load();
  }

  @override
  Future<Todo> findOne(int id) async {
    List<Todo> todos = await _source.load();
    return todos.firstWhere((e) => e.id == id);
  }

  Future<List<Todo>> getTodos() async {
    return await findAll();
  }

  Future<List<Todo>> getCompletedTodos() async {
    List<Todo> todos = await _source.load();
    return todos.where((e) => e.completed == true).toList();
  }
}
