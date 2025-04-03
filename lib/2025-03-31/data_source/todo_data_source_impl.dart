import 'dart:io';
import 'dart:convert';
import '../model/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodo() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 1));

    final file = File('/Users/roychoi/Documents/GitHub/flutter-study/assignments/2025-03-31/data_source/todo.json');

    String jsonString = await file.readAsString();

    // Parse JSON string to Map
    Map<String, dynamic> jsonMap = jsonDecode(jsonString);

    // Create Todo object from JSON
    return Todo.fromJson(jsonMap);
  }
}

// // 2번 문제

// class TodoDataSourceImpl implements TodoDataSource {
//   @override
//   Future<List<Todo>> getTodos() async {
//     // Simulate network delay
//     await Future.delayed(Duration(seconds: 1));

//     final file = File('flutter-study/assignments/2025-03-31/data_source/todos.json');

//     String jsonString = await file.readAsString();

//     // Parse JSON string to Map
//     List<dynamic> jsonList = jsonDecode(jsonString);

//     // Create Todo object from JSON
//     return Todo.fromJsonList(jsonList); 
//   }
// }