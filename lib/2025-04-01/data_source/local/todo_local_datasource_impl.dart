import 'dart:convert';
import 'dart:io';
import '../todo_datasource.dart';

class TodoLocalDatasourceImpl implements TodoDatasource {
  final String filePath;

  TodoLocalDatasourceImpl({this.filePath = 'lib/data/todos.json'});

  @override
  Future<List<Map<String, dynamic>>> fetchTodos() async {
    final file = File(filePath);
    final jsonStr = await file.readAsString();
    final List<dynamic> decoded = json.decode(jsonStr);
    return decoded.cast<Map<String, dynamic>>();
  }
}
