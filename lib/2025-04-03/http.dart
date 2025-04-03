import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:modu_3_dart_study/2025-04-03/model/person.dart';

void main() async {
  try {
    // Person(name: '이지롱', age: 20);
    final todo = await getTodo(1);
    print('✅ GET: $todo\n');

    final newTodo = await createTodo("새로운 할 일", true);
    print('✅ POST: $newTodo\n');

    final updatedTodo = await updateTodo(1, "업데이트된 할 일", false);
    print('✅ PUT: $updatedTodo\n');

    final patchedTodo = await patchTodo(1, {"completed": true});
    print('✅ PATCH: $patchedTodo\n');

    final deleteResponse = await deleteTodo(1);
    print('✅ DELETE : $deleteResponse');
  } on SocketException {
    print('🚫 인터넷 연결 없음 (네트워크 오류)');
  } on TimeoutException {
    print('⏳ 요청 시간이 초과됨 (서버 응답 없음)');
  } on FormatException {
    print('📛 JSON 파싱 실패 (응답이 JSON이 아님)');
  } on HttpException catch (e) {
    print('⚠️ HTTP 오류 발생: ${e.message}');
  } catch (e) {
    print('⚠️ 알 수 없는 오류 발생: $e');
  }
}

/// ✅ GET 요청 (할 일 조회)
Future<Map<String, dynamic>> getTodo(int id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'))
      .timeout(const Duration(seconds: 5));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw HttpException('GET 요청 실패: 상태 코드 ${response.statusCode}');
  }
}

/// ✅ POST 요청 (새로운 할 일 추가)
Future<Map<String, dynamic>> createTodo(String title, bool completed) async {
  final response = await http
      .post(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"title": title, "completed": completed, "userId": 1}),
      )
      .timeout(const Duration(seconds: 5));

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    throw HttpException('POST 요청 실패: 상태 코드 ${response.statusCode}');
  }
}

/// ✅ PUT 요청 (할 일 전체 수정)
Future<Map<String, dynamic>> updateTodo(
  int id,
  String title,
  bool completed,
) async {
  final response = await http
      .put(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "title": title,
          "completed": completed,
          "userId": 1,
        }),
      )
      .timeout(const Duration(seconds: 5));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw HttpException('PUT 요청 실패: 상태 코드 ${response.statusCode}');
  }
}

/// ✅ PATCH 요청 (할 일 부분 수정)
Future<Map<String, dynamic>> patchTodo(
  int id,
  Map<String, dynamic> updates,
) async {
  final response = await http
      .patch(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(updates),
      )
      .timeout(const Duration(seconds: 5));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw HttpException('PATCH 요청 실패: 상태 코드 ${response.statusCode}');
  }
}

/// ✅ DELETE 요청 (할 일 삭제)
Future<bool> deleteTodo(int id) async {
  final response = await http
      .delete(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'))
      .timeout(const Duration(seconds: 5));

  if (response.statusCode == 200) {
    return true;
  } else {
    throw HttpException('DELETE 요청 실패: 상태 코드 ${response.statusCode}');
  }
}
