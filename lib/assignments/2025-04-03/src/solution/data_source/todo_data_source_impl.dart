import 'dart:convert';

import 'package:http/http.dart' as http;

import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client;
  final String _url;

  TodoDataSourceImpl({required http.Client client, required String url})
    : _client = client,
      _url = url;

  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    try {
      final response = await _client.get(Uri.parse('$_url/$id'));
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(jsonDecode(response.body));
      } else {
        throw Exception('Todo 데이터 가져오기 실패');
      }
    } catch (e) {
      throw Exception('요청이 실패했습니다: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    try {
      final response = await _client.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(jsonDecode(response.body));
      } else {
        throw Exception('Todos 가져오기 실패');
      }
    } catch (e) {
      throw Exception('요청이 실패했습니다: $e');
    }
  }
}
