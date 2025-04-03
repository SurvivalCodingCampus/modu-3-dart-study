import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import '../model/todo.dart';
import 'todo_data_source.dart';

class MockTodoDataSourceImpl implements TodoDataSource {
  final String _url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    final client = MockClient((request) async {
      if (request.url.toString() == _url) {
        final todo = {"userId": 1, "id": 1, "title": "쭈꾸미샤브", "body": "먹고싶다."};

        return http.Response(
          jsonEncode(todo),
          200,
          headers: {
            // HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            "content-type": "application/json; charset=utf-8",
          },
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('투두 로드 실패');
    }
    //if (response.statusCode == 200) {
    //   final Map<String, dynamic> todoJson = jsonDecode(response.body);

    //   return Todo.fromJson(todoJson);
    // } else {
    //   throw Exception('투두 로드 실패');
    // }
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final client = MockClient((request) async {
      if (request.url.toString() == _url) {
        final todos = [
          {"userId": 1, "id": 1, "title": "쭈꾸미샤브", "body": "먹고싶다."},
          {"userId": 1, "id": 2, "title": "허니콤보", "body": "먹고싶다."},
          {"userId": 1, "id": 3, "title": "연어간장", "body": "먹고싶다."},
          {"userId": 1, "id": 4, "title": "딸기케이크", "body": "먹고싶다."},
        ];
        return http.Response(
          jsonEncode(todos),
          200,
          headers: {
            // HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            "content-type": "application/json; charset=utf-8",
          },
        );
      }
      return http.Response('Not Found', 404);
    });

    final response = await client.get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body).cast<Map<String, dynamic>>();
    } else {
      throw Exception('투두 로드 실패');
    }
    // if (response.statusCode == 200) {
    //   final List<dynamic> jsonList = jsonDecode(response.body);
    //   return jsonList.map((todo) => Todo.fromJson(todo)).toList();
    // } else {
    //   throw Exception('투두 로드 실패');
    // }
  }
}
