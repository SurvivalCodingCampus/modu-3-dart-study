import '../todo_data_source.dart';

class MockTodoDataSource implements TodoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllTodos() async {
    return [
      {"userId": 1, "id": 1, "title": "Task 1", "completed": false},
      {"userId": 1, "id": 2, "title": "Task 2", "completed": true},
      {"userId": 2, "id": 3, "title": "Task 3", "completed": true},
    ];
  }
}