import 'dart:convert';
import 'dart:io';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({required this.userId, required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }
}

class TodoDataSourceImpl implements TodoDataSource {
  final String filePath;

  TodoDataSourceImpl(this.filePath);

  @override
  Future<Todo> getTodo() async {
    try {
      final file = File(filePath);
      final jsonString = await file.readAsString();

      final Map<String, dynamic> jsonData = jsonDecode(jsonString);

      return Todo.fromJson(jsonData);
    } catch (e) {
      throw Exception('파일 읽기 또는 파싱 중 오류가 발생했습니다: $e');
    }
  }
}