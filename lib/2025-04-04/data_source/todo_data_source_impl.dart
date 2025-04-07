import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-04/data_source/todo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/dto/todo_dto.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final http.Client _client; // 이게 정확히 무슨 역활을 하는건가?

  TodoDataSourceImpl(this._client);

  @override
  Future<TodoDto> getTodo(int id) async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    );

    if (response.statusCode == 200) {
      return TodoDto.fromJson(jsonDecode(response.body));
    }
    return throw HttpException('투두목록 블러오기 실패 ${response.statusCode}');
  }

  @override
  Future<List<TodoDto>> getTodos() async {
    final response = await _client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
    );
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => TodoDto.fromJson(e))
          .toList();
    }
    return throw HttpException('투두목록 블러오기 실패 ${response.statusCode}');
  }
}
