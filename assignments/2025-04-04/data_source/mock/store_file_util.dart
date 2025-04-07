import 'dart:convert';
import 'dart:io';

class StoreFileUtil {
  final String filePath =
      '${Directory.current.path}/assignments/2025-04-04/data/mock_store.json';

  StoreFileUtil();

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
