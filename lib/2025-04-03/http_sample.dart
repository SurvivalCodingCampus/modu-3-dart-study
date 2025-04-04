import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() async {
  final mockClient = MockClient((request) async {
    if (request.url.toString() ==
        'https://jsonplaceholder.typicode.com/todos/1') {
      return http.Response.bytes(
        utf8.encode(jsonEncode({'title': '홍길동', 'id': 20, 'body': 'test', 'userId': 1})),
        200,
      );
    }

    return http.Response('Not Found', 404);
  });

  final todo = await getTodo(mockClient, 1);
  print(todo);
}

Future<Map<String, dynamic>> getTodo(http.Client client, int id) async {
  // File 에서 JsonString
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('getTodo 실패');
  }

  return jsonDecode(utf8.decode(response.bodyBytes));
}
