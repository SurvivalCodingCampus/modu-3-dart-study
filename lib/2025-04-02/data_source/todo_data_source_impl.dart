// import 'dart:convert';
// import 'dart:io';
//
// import 'package:modu_3_dart_study/2025-04-02/data_source/todo_data_source.dart';
//
// class TodoDataSourceImpl implements TodoDataSource {
//   final String path;
//
//   TodoDataSourceImpl(this.path);
//
//   @override
//   Future<List<Map<String, dynamic>>> readTodos() async {
//     String jsonString= await File(path).readAsString();
//     final List jsonList = jsonDecode(jsonString);
//     List<Map<String,dynamic>> json = List<Map<String,dynamic>>.from(jsonList);
//     return json;
//   }
//
//   @override
//   Future<void> writeTodos(List<Map<String, dynamic>> todos) {
//
//   }
// }