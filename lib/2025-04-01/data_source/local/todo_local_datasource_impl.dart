import 'dart:convert';
import 'dart:io';
import '../todo_datasource.dart';

class TodoLocalDatasourceImpl implements TodoDatasource {
  final String filePath;

  TodoLocalDatasourceImpl({this.filePath = 'lib/2025-04-01/data/todos.json'});

  @override
  Future<List<Map<String, dynamic>>> fetchTodos() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final decoded = json.decode(jsonStr);

    return (decoded as List)
        .map((e) => Map<String, dynamic>.from(e))
        .toList();
  }
}
