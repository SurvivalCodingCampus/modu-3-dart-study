import '../data_source/todo_data_source.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    return [
      {
        "userId": 8,
        "id": 148,
        "title": "esse quas et quo quasi exercitationem",
        "completed": false,
      },
      {
        "userId": 8,
        "id": 149,
        "title": "animi voluptas quod perferendis est",
        "completed": false,
      },
      {
        "userId": 8,
        "id": 150,
        "title": "eos amet tempore laudantium fugit a",
        "completed": false,
      },
      {
        "userId": 8,
        "id": 151,
        "title": "accusamus adipisci dicta qui quo ea explicabo sed vero",
        "completed": true,
      },
    ];
  }
}
