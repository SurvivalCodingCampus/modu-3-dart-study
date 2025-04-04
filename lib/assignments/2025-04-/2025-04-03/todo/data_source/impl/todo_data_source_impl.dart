import 'dart:convert';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/common/const/api_url.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-03/todo/data_source/todo_data_source.dart';
import 'package:http/http.dart' as http;

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client;
  final baseUrl = ApiUrl.todoBaseUrl;

  TodoDataSourceImpl(this._client);

  @override
  Future<Map<String, dynamic>> getTodo(int id) async {
    final resp = await _client.get(Uri.parse(baseUrl + '/$id'));
    if(resp.statusCode != 200){
      throw Exception('투두 가져오기 실패');
    }
    return jsonDecode(resp.body);
  }

  @override
  Future<List<Map<String, dynamic>>> getTodos() async {
    final resp = await _client.get(Uri.parse(baseUrl));
    if(resp.statusCode != 200){
      throw Exception('투두 리스트 가져오기 실패');
    }
    return (jsonDecode(resp.body) as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
  }
}