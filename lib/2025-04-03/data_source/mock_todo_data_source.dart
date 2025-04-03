import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../../2025-04-01/model/todo.dart';
import 'todo_data_source.dart';

class MockTodoDataSource implements TodoDataSource {
  final http.Client _client = MockClient((request) async {
    final url = request.url.toString();

    if (url.endsWith('/todos')) {
      return http.Response(
        jsonEncode([
          {'userId': 1, 'id': 1, 'title': '할 일 1', 'completed': false},
          {'userId': 1, 'id': 2, 'title': '끝낸 일 2', 'completed': true},
        ]),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    } else if (url.endsWith('/todos/1')) {
      return http.Response(
        jsonEncode({
          'userId': 1,
          'id': 1,
          'title': '할 일 1',
          'completed': false,
        }),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    }

    return http.Response('Not Found', 404);
  });

  @override
  Future<List<Todo>> getTodos() async {
    final res = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (res.statusCode == 200) {
      final list = jsonDecode(utf8.decode(res.bodyBytes)) as List;
      return list.map((e) => Todo.fromJson(e)).toList();
    } else {
      throw Exception('todos 불러오기 실패');
    }
  }

  @override
  Future<Todo> getTodo(int id) async {
    final res = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
      headers: {'Accept-Charset': 'utf-8'},
    );

    if (res.statusCode == 200) {
      final json = jsonDecode(utf8.decode(res.bodyBytes));
      return Todo.fromJson(json);
    } else {
      throw Exception('todo $id 불러오기 실패');
    }
  }
}
