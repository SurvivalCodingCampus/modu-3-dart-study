import 'dart:convert';

import '../2025-03-25/index.dart';
import 'todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  static const todoPath = 'assignment/2025-03-31/todo.json';
  static const todosPath = 'assignment/2025-03-31/todos.json';

  final FileOperation _fileOperation;

  FileOperation get fileOperation => _fileOperation;

  TodoDataSourceImpl({FileOperation? fileOperation})
    : _fileOperation = fileOperation ?? DefaultFileOperations();

  @override
  Future<Todo> getTodo() async {
    final jsonString = await fileOperation.readAsync(todoPath);
    final decodedJson = jsonDecode(jsonString);
    return Todo.fromJson(decodedJson);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final jsonString = await fileOperation.readAsync(todosPath);
    final List<dynamic> decodedJson = jsonDecode(jsonString);
    final List<Todo> todos = decodedJson.map((e) => Todo.fromJson(e)).toList();
    return todos;
  }
}
