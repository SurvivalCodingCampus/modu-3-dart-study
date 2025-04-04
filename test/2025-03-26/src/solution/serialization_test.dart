import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/assignments/2025-03-26/src/solution/collection.dart';
import 'package:modu_3_dart_study/assignments/2025-03-26/src/solution/collection_chart_data.dart';
import 'package:modu_3_dart_study/assignments/2025-03-26/src/solution/sale_price.dart';
import 'package:test/test.dart';

void main() {
  final file = File('assignments/2025-03-26/src/solution/chart_data.json');
  String contents = file.readAsStringSync();
  Map<String, dynamic> jsonData = jsonDecode(contents);

  group('Serialization', () {
    group('Collection', () {
      test('직렬화', () {
        Collection collection = Collection.fromJson(jsonData);

        expect(collection, isA<Collection>());
        expect(() => jsonEncode(collection.toJson()), returnsNormally);
        expect(collection.toJson(), jsonData);
      });

      test('역직렬화', () {
        Collection collection = Collection.fromJson(jsonData);

        final jsonString = jsonEncode(collection.toJson());

        final json = jsonDecode(jsonString);

        expect(json, jsonData);
      });
    });

    group('ChartData', () {
      test('직렬화', () {
        // collectionChartDataList의 첫번째 아이템
        final expected = '''{ 
          "collectionName": "collection1",
          "collectionSalePrice": [
            {
              "price": 58.25,
              "cvtDatetime": "2023-03-26T08:00:00"
            },
            {
              "price": 58.50,
              "cvtDatetime": "2023-03-26T08:00:10"
            }
          ]
        }''';

        CollectionChartData testData = CollectionChartData(
          collectionName: 'collection1',
          collectionSalePrice: [
            SalePrice(
              price: 58.25,
              cvtDateTime: DateTime(2023, 03, 26, 08, 00, 00),
            ),
            SalePrice(
              price: 58.50,
              cvtDateTime: DateTime(2023, 03, 26, 08, 00, 10),
            ),
          ],
        );

        expect(testData, isA<CollectionChartData>());
        expect(() => jsonEncode(testData.toJson()), returnsNormally);
        expect(testData.toJson(), jsonDecode(expected));
      });

      test('직렬화 - collectionSalePrice가 없는 경우', () {
        // collectionChartDataList에서 collectionSalePrice가 키가 없는 아이템
        final expected = '''{ 
          "collectionName": "collection68"
        }''';

        CollectionChartData testData = CollectionChartData(
          collectionName: 'collection68',
          collectionSalePrice: null,
        );

        expect(testData, isA<CollectionChartData>());
        expect(() => jsonEncode(testData.toJson()), returnsNormally);
        expect(testData.toJson(), jsonDecode(expected));
      });

      test('역직렬화', () {
        final expected = '''{ 
          "collectionName": "collection1",
          "collectionSalePrice": [
            {
              "price": 58.25,
              "cvtDatetime": "2023-03-26T08:00:00"
            },
            {
              "price": 58.50,
              "cvtDatetime": "2023-03-26T08:00:10"
            }
          ]
        }''';

        CollectionChartData testData =
            Collection.fromJson(jsonData).collectionChartDataList.first;

        final jsonString = jsonEncode(testData.toJson());

        final json = jsonDecode(jsonString);

        expect(json, jsonDecode(expected));
      });
    });

    group('SalePrice', () {
      test('직렬화', () {
        final expected = '''{
              "price": 58.25,
              "cvtDatetime": "2023-03-26T08:00:00"
            }''';

        final salePrice = SalePrice(
          price: 58.25,
          cvtDateTime: DateTime(2023, 03, 26, 08, 00, 00),
        );

        expect(salePrice.toJson(), jsonDecode(expected));
      });

      test('역직렬화', () {
        final expected = '''{
              "price": 58.25,
              "cvtDatetime": "2023-03-26T08:00:00"
            }''';

        final salePrice = SalePrice.fromJson(jsonDecode(expected));

        final jsonString = jsonEncode(salePrice.toJson());

        final json = jsonDecode(jsonString);

        expect(json, jsonDecode(expected));
      });
    });
  });
}
