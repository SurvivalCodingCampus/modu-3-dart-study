import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-03-26/collection_chart_data_list.dart';

void main() {
  final String filePath =
      Directory.current.path + '/assignments/2025-03-26/chat_data.json';

  group('CollectionChartDataList 테스트', () {
    final File jsonFile = File(filePath);
    String originalJsonString = jsonFile.readAsStringSync();
    final Map<String, dynamic> jsonMap = jsonDecode(originalJsonString);
    CollectionChartDataList deserializedObject =
        CollectionChartDataList.fromJson(jsonMap);

    test('역직렬화된 데이터를 다시 직렬화한 결과가 원본과 동일해야 함', () {
      final String serializedJsonString = jsonEncode(
        deserializedObject.toJson(),
      );

      expect(jsonDecode(serializedJsonString), jsonMap);
    });
  });
}
