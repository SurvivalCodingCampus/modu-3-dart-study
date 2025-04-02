import 'package:modu_3_dart_study/data_source/todo_data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/model/todo.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Todo>> getTodos() async {
    final jsonData = [
      {"userId": 1, "id": 1, "title": "Toeic test", "completed": true},
      {"userId": 1, "id": 2, "title": "hsk test", "completed": false},
      {"userId": 1, "id": 3, "title": "jlpt test", "completed": true},
    ];
    return jsonData.map((e) => Todo.fromJson(e)).toList();
  }
}
