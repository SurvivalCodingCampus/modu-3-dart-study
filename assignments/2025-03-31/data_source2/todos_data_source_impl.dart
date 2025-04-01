import 'dart:convert';
import 'dart:io';

import '../model/todos.dart';
import 'todos_data_source.dart';

class TodosDataSourceImpl implements TodosDataSource {
  @override
  Future<List<Todos>> getTodos() async {
    try {
      String fileAddress = 'assignments/2025-03-31/model/todos.json';
      final file = File(fileAddress);
      final String jsonString = await file.readAsString();
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<Todos> todos =
          jsonList.map((todosJson) => Todos.fromJson(todosJson)).toList();
      return todos;
    } catch (e) {
      throw (e);
    }
  }
}
