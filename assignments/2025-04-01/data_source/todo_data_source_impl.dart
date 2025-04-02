import 'dart:convert';
import 'dart:io';

import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String path;

  TodoDataSourceImpl({required this.path});
  @override
  Future<List<Map<String, dynamic>>> getAllTodos() async {
    String jsonString = await File(path).readAsString();
    List jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => e as Map<String, dynamic>).toList();
    
  }
}
