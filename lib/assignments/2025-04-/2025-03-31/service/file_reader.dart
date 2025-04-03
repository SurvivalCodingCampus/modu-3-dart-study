import 'dart:convert';
import 'dart:io';

class FileReader {
  final String path;

  FileReader(this.path);

  Map<String, dynamic> readJson() {
    final file = File(path);
    final data = file.readAsStringSync();
    final json = jsonDecode(data);
    // 데이터가 리스트이면 리스트를 Map으로 변환하여 반환
    if (json is List) {
      return {'list': json};
    }
    return json;
  }

  List<String> readCsv() {
    final file = File(path);
    final data = file.readAsLinesSync();
    return data;
  }
}
