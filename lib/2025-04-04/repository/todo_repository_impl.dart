import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-04/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/data_source/todo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/model/todo.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/todo_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/mepper/todo_mepper.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;
  TodoRepositoryImpl(this._dataSource);

  @override
  Future<Todo> getTodo(int id) async {
    final todoDto = await _dataSource.getTodo(id);
    return todoDto.toTodo(); // mepper 사용
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todoDtos = await _dataSource.getTodos();
    return todoDtos.map((it) => it.toTodo()).toList(); // mepper 사용
  }
}

void main() async {
  final httpClient = http.Client();
  final dataSource = TodoDataSourceImpl(httpClient);
  final repository = TodoRepositoryImpl(dataSource);

  final todo = await repository.getTodo(1);
  print('📌 Todo: ${todo.title}, 완료 여부: ${todo.completed}');

  final todos = await repository.getTodos();
  print('✅ 총 ${todos.length}개의 Todo를 불러왔습니다.');
}
