import 'todo_data_source.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  final List<Map<String, dynamic>> _todoList = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false,
    },
    {"userId": 1, "id": 3, "title": "fugiat veniam minus", "completed": false},
    {"userId": 1, "id": 4, "title": "et porro tempora", "completed": true},
    {
      "userId": 1,
      "id": 5,
      "title":
          "laboriosam mollitia et enim quasi adipisci quia provident illum",
      "completed": false,
    },
    {
      "userId": 1,
      "id": 6,
      "title": "qui ullam ratione quibusdam voluptatem quia omnis",
      "completed": false,
    },
    {
      "userId": 1,
      "id": 7,
      "title": "illo expedita consequatur quia in",
      "completed": false,
    },
    {
      "userId": 1,
      "id": 8,
      "title": "quo adipisci enim quam ut ab",
      "completed": true,
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> getCompletedTodos() async {
    return _todoList.where((e) => e['completed'] == true).toList();
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    return _todoList;
  }
}
