import 'dart:convert';
import 'dart:io';

import '../todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String filePath;

  TodoDataSourceImpl(this.filePath);

  @override
  Future<List<Map<String, dynamic>>> getAllTodos() async {
    final File file = File(filePath);
    final String jsonString = await file.readAsString();
    final List<dynamic> data = json.decode(jsonString);
    return List<Map<String, dynamic>>.from(data);

  }
}
