import 'dart:convert';

import '../data_source/todo_data_source.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart' as http;

class MockTodoDataSourceImpl implements TodoDataSource {
  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos/1') {
        return http.Response(
          jsonEncode({'id': 1, 'title': '밥먹기', 'Completed': false}),
          200,
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final client = MockClient((request) async {
      if (request.url.toString() ==
          'https://jsonplaceholder.typicode.com/todos/1') {
        return http.Response(
          jsonEncode([
            {'id': 1, 'title': '운동하기', 'Completed': false},
            {'id': 2, 'title': '피아노 치기', 'Completed': true},
          ]),
          200,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
