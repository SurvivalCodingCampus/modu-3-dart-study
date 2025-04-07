import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../2025-04-03/solution3/model/todo.dart';
import '../../../2025-04-03/solution3/data_source/todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<Todo>> getTodos({required String url}) async {
    final response = await http.get(Uri.parse(url));
    List data = jsonDecode(response.body);
    return data.map((e) => Todo.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<Todo?> getTodo({
    required String url,
    required int userId,
    required int id,
  }) async {
    final List<Todo> todoList = await getTodos(url: url);
    for (Todo items in todoList) {
      if (items.id == id && items.userId == userId) {
        print("Todo 아이템을 찾았습니다");
        return items;
      }

      print("Todo 아이템이 존재하지 않습니다");
      break;
    }
  }
}
