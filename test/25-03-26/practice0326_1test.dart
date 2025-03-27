import 'dart:convert';
import 'dart:io';

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-26/practice0326_1.dart';

void main() {
  group('collectionChartDataList', () {
    const testFilePath =
        '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-26';
    test('역직렬화 확인', () {
      File file = File(
        '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-26/json_data.json',
      );
      String readJsonString = file.readAsStringSync();
      final Map<String, dynamic> data = jsonDecode(readJsonString);
      final CollectionChartDataList collectionChartDataList =
          CollectionChartDataList.fromJson(data);
      expect(
        collectionChartDataList.collectionChartDataList[0].collectionName,
        'collection1',
      );
      expect(
        collectionChartDataList
            .collectionChartDataList[0]
            .collectionSalePrice[0]
            .price,
        58.25,
      );
    });
    test('역직렬화 후 dart data 폴더 생성 확인', () {
      const filePath =
          '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-26/json_data.json';

      File file = File(filePath);
      if (!file.existsSync()) {
        print('파일이 존재하지 않습니다.');
        return;
      }
      try {
        String jsonString = file.readAsStringSync();
        final Map<String, dynamic> jsonData = jsonDecode(jsonString);
        final collectionChartDataList = CollectionChartDataList.fromJson(
          jsonData,
        );
        File file2 = File('$testFilePath/json_data.dart');
        file2.writeAsStringSync(jsonString);
      } on FormatException {
        print('JSON 형식이 올바르지 않습니다.');
      }
      File file3 = File('$testFilePath/json_data.dart');
      expect(file3.existsSync(), true);
    });
    tearDown(() {
      final file = File(testFilePath);
      if (file.existsSync()) {
        file.deleteSync();
      }
    });
  });
}
