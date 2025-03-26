import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

import '../../assignments/2025-03-26/collection_sale_price.dart';

void main() {
  late File jsonFile;
  const int collectionLength = 75;

  group('컬렉션 세일 프라이스 : ', () {
    setUp(() {
      try {
        jsonFile = File('chart_data.json');
      } on PathNotFoundException {
        throw ArgumentError('해당 파일이 없습니다.');
      }
    });
    test('Decode', () {
      try {
        final Map<String, dynamic> jsonDecodeData = jsonDecode(
          jsonFile.readAsStringSync(),
        );
        final List<CollectionSalePrice> collectionSalePrice =
            (jsonDecodeData['collectionChartDataList'] as List<dynamic>)
                .map(
                  (e) =>
                      CollectionSalePrice.fromJson(e as Map<String, dynamic>),
                )
                .toList();

        expect(collectionSalePrice.length, collectionLength);
      } on FormatException {
        throw ArgumentError('Json 형식을 지켜주세요.');
      }
    });
  });
}
