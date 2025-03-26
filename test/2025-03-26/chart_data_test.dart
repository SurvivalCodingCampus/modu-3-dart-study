import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-26/chart_data.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  final File file = File('lib/2025-03-26/chart_data.json');
  final String fileString = file.readAsStringSync();
  final Map<String, dynamic> decodedJson = jsonDecode(fileString);

  test('역직렬화 테스트', () {
    // 역직렬화 과정 안한 파일
    String originalJsonString = jsonEncode(decodedJson);

    // 역직렬화 후 다시 복원
    final CollectionChartDataList collectionChartDataList =
        CollectionChartDataList.fromJson(decodedJson);

    final Map<String, dynamic> json = collectionChartDataList.toJson();

    String jsonString = jsonEncode(json);

    expect(
      originalJsonString,
      jsonString,
      reason: '원본 파일을 jsonEncode 한 것과 역직렬화를 수행한 것이 같으면 맞음.',
    );
  });
}
