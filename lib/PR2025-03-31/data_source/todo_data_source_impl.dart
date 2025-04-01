import 'dart:convert';
import 'package:modu_3_dart_study/PR2025-03-31/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/PR2025-03-31/model/todo.dart';

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
