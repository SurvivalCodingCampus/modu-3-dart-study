import 'dart:convert';
import 'dart:io';

import '../todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Map<String, dynamic>>> fetchTodos(String path) async {
    final jsonString = await File(path).readAsString();
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
