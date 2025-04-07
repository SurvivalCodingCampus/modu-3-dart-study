import 'dart:convert';

import 'package:http/http.dart' as http;


void main() async {
  final res = getTodo(1);
  print(res);
}

Future<Map<String, dynamic>> getTodo(int id) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
  );

  if (response.statusCode != 200) {
    throw Exception('getTodo 실패');
  }
  return jsonDecode(response.body);
}
