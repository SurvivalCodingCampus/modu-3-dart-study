import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/PR2025-03-31/data_source2/todo_data_source.dart';
import 'package:modu_3_dart_study/PR2025-03-31/model/todos.dart';

class TodosDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Todos>> getTodos() async {
    try {
      String fileAddress = 'lib/PR2025-03-31/model/todos.json';
      File file = File(fileAddress);
      final String jsonString = await file.readAsString();

      List<dynamic> jsonList = jsonDecode(jsonString);
      List<Todos> todos =
          jsonList.map((todosJson) => Todos.fromJson(todosJson)).toList();
      return todos;
    } catch (e) {
      throw Exception(e);
    }
  }
}
