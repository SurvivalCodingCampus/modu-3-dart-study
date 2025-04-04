import 'dart:convert';
import 'dart:io';

abstract class JsonDataSource {
  Future<List<Map<String, dynamic>>> getItems(String fileName) async {
    try {
      final File file = File(fileName);
      final String raw = await file.readAsString();
      final List<dynamic> json = jsonDecode(raw);

      return json.map((e) => e as Map<String, dynamic>).toList();
    } on PathNotFoundException {
      throw ArgumentError('존재하지 않는 파일입니다.');
    } on FormatException {
      throw ArgumentError('Json 형식에 맞춰주세요.');
    }
  }

  Future<Map<String, dynamic>> getItem(String fileName, int id) async {
    try {
      final File file = File(fileName);
      final String raw = await file.readAsString();

      return jsonDecode(raw);
    } on PathNotFoundException {
      throw ArgumentError('존재하지 않는 파일입니다.');
    } on FormatException {
      throw ArgumentError('Json 형식에 맞춰주세요.');
    }
  }
}
