import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'package:modu_3_dart_study/2025-03-26/index.dart';
import 'package:modu_3_dart_study/2025-03-25/default_file_operations.dart';

void main() {
  group('CollectionChartData 테스트', () {
    final defaultFileOperations = DefaultFileOperations();
    const sourcePath = 'lib/2025-03-26/chart_data.json';

    test('직렬화, 역직렬화가 정상적으로 이뤄지고 필드가 같아야 한다.', () {
      // 역직렬화
      final jsonString = defaultFileOperations.read(sourcePath);
      final json = jsonDecode(jsonString);
      final model = CollectionChartDataListModel.fromJson(json);

      // 테스트 위한 다시 직렬화
      final serializationJson = model.toJson();
      final serializationJsonString = jsonEncode(serializationJson);

      // 테스트 위한 다시 역직렬화
      final deserializationJson = jsonDecode(serializationJsonString);
      final deserializationModel = CollectionChartDataListModel.fromJson(
        deserializationJson,
      );

      // 리스트 비교
      final eq = ListEquality();
      final isEqualList = eq.equals(
        model.collectionChartDataList,
        deserializationModel.collectionChartDataList,
      );
      expect(isEqualList, isTrue);
    });
  });
}
