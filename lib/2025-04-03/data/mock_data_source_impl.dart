import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' as client;
import 'package:http/testing.dart';

import '../data_source/todo_data_source.dart';
import '../model/todo.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  final MockClient _mockClient;

  MockTodoDataSourceImpl() : _mockClient = MockClient(_mockResponse);

  static Future<http.Response> _mockResponse(http.Request request) async {
    final uri = request.url;

    if (uri.path.startsWith('/todos/')) {
      final id = int.tryParse(uri.path
          .split('/')
          .last);
      if (id != null) {
        return http.Response(
          jsonEncode({'id': id, 'title': 'Todo $id', 'completed': false}),
          200,
        );
      }
    } else if (uri.path == '/todos') {
      return http.Response(
        jsonEncode([
          {'id': 1, 'title': 'Test Todo1', 'completed': false},
          {'id': 2, 'title': 'Test Todo2', 'completed': true},
        ]),
        200,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
    }
    return http.Response('Not Found', 404);
  }
}

@override
Future<Todo> getTodo(int id) async {


  final response = await client.get(
    Uri.parse('todos/$id'),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return Todo.fromJson(json);
  } else {
    throw Exception('todo 조회가 실패했습니다.');
  }
}

@override
Future<List<Todo>> getTodos() async {
  final response = await client.get(
    Uri.parse('/todos'),
  );

  if (response.statusCode == 200) {
    final list = jsonDecode(response.body) as List;
    return list.map((e) => Todo.fromJson(e)).toList();
  } else {
    throw Exception('todo 목록 조회가 실패했습니다.');
  }
}
