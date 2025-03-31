import 'dart:convert';
import '../model/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    try {
      final String jsonString = '''{
       "userId": 1,
       "id": 1,
       "title": "delectus aut autem",
       "completed": false
     }''';
      final Map<String, dynamic> json = jsonDecode(jsonString);
      return Todo.fromJson(json);
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
