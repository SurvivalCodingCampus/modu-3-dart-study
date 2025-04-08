import 'dart:convert';
import 'dart:io';

import 'data_source.dart';

class DataSourceImpl implements DataSource {
  @override
  Future<List<dynamic>> getList(String filePath) async {
    try {
      final File jsonFile = File(filePath);
      String jsonFromFile = await jsonFile.readAsString();

      return jsonDecode(jsonFromFile);
    } on FormatException {
      throw FormatException('JSON 파싱 중 오류가 발생했습니다');
    } catch (e) {
      print(e);
      throw Exception('Error fetching: $e');
    }
  }
}
