import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/todo.dart';
import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String url = 'https://jsonplaceholder.typicode.com/posts';
  final http.Client _client;
  TodoDataSourceImpl(this._client);

  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    final response = await _client.get(Uri.parse('$url/$id'));
    if (response.statusCode == 200) {
      return json.decode(response.body).cast<Map<String, dynamic>>();
    } else {
      throw HttpException('HTTP 오류 ${response.statusCode}');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    try {
      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return (jsonDecode(response.body).cast<Map<String, dynamic>>());
      } else {
        throw HttpException('HTTP 오류 ${response.statusCode}');
      }
    } on HttpException catch (e) {
      throw HttpException('HTTP 오류 ${e.message}');
    } catch (e) {
      throw Exception('알 수 없는 오류 $e');
    }
  }
}
