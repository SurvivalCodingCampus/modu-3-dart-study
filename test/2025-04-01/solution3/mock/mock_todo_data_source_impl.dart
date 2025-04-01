import 'package:modu_3_dart_study/2025-04-01/solution3/data_source/todo_data_source.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    return [
      {
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false
      },
      {
        "userId": 1,
        "id": 2,
        "title": "quis ut nam facilis et officia qui",
        "completed": false
      }
    ];
  }
}