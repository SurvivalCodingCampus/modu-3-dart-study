import 'dart:convert';
import 'dart:io';

class UserFileUtil {
  final String filePath =
      '${Directory.current.path}/lib/assignments/2025-04-07/data_source/mock/mock_data.json';

  UserFileUtil();

  Future<List<Map<String, dynamic>>> readJsonData() async {
    try {
      final file = File(filePath);
      return jsonDecode(await file.readAsString()).cast<Map<String, dynamic>>();
    } catch (e) {
      throw Exception('파일 읽기 오류: $e');
    }
  }

  Future<void> writeJsonFile(List<Map<String, dynamic>> data) async {
    try {
      final file = File(filePath);
      await file.writeAsString(jsonEncode(data));
    } catch (e) {
      throw Exception('파일 쓰기 오류: $e');
    }
  }
}
