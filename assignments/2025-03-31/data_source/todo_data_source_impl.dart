import 'dart:convert';
import 'dart:io';
import '../model/todo.dart';
import 'todo_data_source.dart';

abstract interface class TodoDataSource {
  Future<List<Todo>> getTodos();
}

class TodoDataSourceTmpl implements TodoDataSource {
  final String file;

  TodoDataSourceTmpl(this.file);

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final filePath = File(file);
      final jsonString = await filePath.readAsString();

      final data = jsonDecode(jsonString) as List<dynamic>;

      final todos = data
          .map((item) => Todo.fromJson(item as Map<String, dynamic>))
          .toList();

      return todos;
    } catch (e) {
      throw Exception("오류가 발생했습니다: $e");
    }
  }
}