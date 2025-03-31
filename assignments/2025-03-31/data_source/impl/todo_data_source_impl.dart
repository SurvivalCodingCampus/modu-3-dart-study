import 'dart:convert';
import 'dart:io';

import '../../model/todo.dart';
import '../todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Todo> getTodoFromFile(String fileName) async {
    try {
      File todoFile = File(fileName);
      String todoJson = await todoFile.readAsString();

      return Todo.fromJson(jsonDecode(todoJson));
    } on PathNotFoundException {
      throw ArgumentError('파일을 찾을 수 없습니다.');
    }
  }

  @override
  Future<List<Todo>> getTodosFromFile(String listFileName) async {
    try {
      File todoFile = File(listFileName);
      String todoJson = await todoFile.readAsString();

      return (jsonDecode(todoJson) as List<dynamic>)
          .map((e) => Todo.fromJson(e))
          .toList();
    } on PathNotFoundException {
      throw ArgumentError('파일을 찾을 수 없습니다.');
    }
  }
}
