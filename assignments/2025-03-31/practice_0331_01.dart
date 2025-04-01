//위 링크에서 제공되는 Json 을 todo.json 으로 저장
//todo.json 파일을 읽어서 Todo 객체로 변환하는 기능 작성
//Todo, TodoDataSourceImpl 작성

import 'dart:convert';
import 'dart:io';

abstract interface class TodoDataSource {
  Future<Todo> getTodo();
  Future<List<Todo>> getTodos();
}

class TodoDataSourceImpl implements TodoDataSource {
  final String filePath;
  TodoDataSourceImpl(this.filePath);
  @override
  Future<Todo> getTodo() async {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    return Todo.fromJson(jsonData);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((e) => Todo.fromJson(e)).toList();
  }
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
  @override
  String toString() {
    return 'Todo(userId: $userId, id: $id, title: "$title", completed: $completed)';
  }
}

void main() async {
  final dataSource = TodoDataSourceImpl(
    '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/todo.json',
  );
  final todo = await dataSource.getTodo();
  print(todo);

  final dataSource2 = TodoDataSourceImpl(
    '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/tododata_source.json',
  );
  final todo2 = await dataSource2.getTodos();
  print(todo2.length);
}
