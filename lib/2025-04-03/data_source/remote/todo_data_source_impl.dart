import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/config/api_config.dart';

import '../todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client;

  TodoDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final response = await _client.get(Uri.parse(ApiConfig.todosUrlString));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((e) => Map<String, dynamic>.from(e)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    final response = await _client.get(Uri.parse(ApiConfig.todoUrlString(id)));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load todo');
    }
  }
}
