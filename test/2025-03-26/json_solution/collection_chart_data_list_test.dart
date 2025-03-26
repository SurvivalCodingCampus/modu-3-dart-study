import 'dart:convert';
import 'dart:io';
import 'package:modu_3_dart_study/2025-03-26/json_solution/collection_chart_data_list.dart';
import 'package:test/test.dart';


void main() {
  // setUpAll()에서 파일 로드 뒤 초기화 하게 위해 late로 정의
  late final String jsonString;

  final String jsonPath = 'test/2025-03-26/json_solution/chart_data.json';

// 각 테스트 함수에 파일 로드를 위해 비동기로 처리
  setUpAll(() async {
    try {
      final file = File(jsonPath); // 파일 경로 확인
      jsonString = await file.readAsString();  // 파일 읽기 비동기 작업
      if (jsonString.isEmpty) {
        throw '파일 내용이 비어있음';
      }
    } catch (e) {
      fail('❌ 파일 읽기 실패: $e');  // 예외 발생 시 테스트 실패
    }
  });

  group('CollectionChartDataResponse 테스트', () {
    test('1. JSON → CollectionChartDataResponse 파싱', () {
      print('------ 1단계: JSON → CollectionChartDataResponse 파싱 ------');
      try {
        final jsonMap = jsonDecode(jsonString);
        final response = CollectionChartDataResponse.fromJson(jsonMap);

        expect(response.collectionChartDataList.isNotEmpty, isTrue);
        print('✅ collectionChartDataList.length: ${response.collectionChartDataList.length}');
      } catch (e) {
        fail('❌ JSON 파싱 실패: $e');
      }
    });

    test('2. collectionSalePrice == null 검증', () {
      print('------ 3단계: collectionSalePrice null 확인 ------');
      try {
        final jsonMap = jsonDecode(jsonString);
        final response = CollectionChartDataResponse.fromJson(jsonMap);

        final hasNull = response.collectionChartDataList.any(
                (item) => item.collectionSalePrice == null);

        expect(hasNull, isTrue);
        print('✅ null인 collectionSalePrice 존재함');
      } catch (e) {
        fail('❌ null 필드 확인 중 예외 발생: $e');
      }
    });

    test('3. 잘못된 날짜 포맷 처리 확인', () {
      print('------ 4단계: 잘못된 날짜 포맷 처리 ------');
      try {
        final badJson = {
          "collectionChartDataList": [
            {
              "collectionName": "Invalid Date",
              "collectionSalePrice": [
                {
                  "price": 99.99,
                  "cvtDatetime": "not-a-date"
                }
              ]
            }
          ]
        };

        final response = CollectionChartDataResponse.fromJson(badJson);
        final datetime = response.collectionChartDataList[0].collectionSalePrice?[0].cvtDatetime;

        expect(datetime, isNull);
        print('✅ 잘못된 날짜 → null 처리됨');
      } catch (e) {
        fail('❌ 날짜 포맷 처리 실패: $e');
      }
    });

    test('4. 누락 필드 처리 확인', () {
      print('------ 5단계: 누락 필드 처리 ------');
      try {
        final missingJson = {
          "collectionChartDataList": [
            {
              // collectionName 누락
              "collectionSalePrice": [
                {
                  "price": 100.0
                  // cvtDatetime 누락
                }
              ]
            }
          ]
        };

        final response = CollectionChartDataResponse.fromJson(missingJson);
        final item = response.collectionChartDataList[0];

        expect(item.collectionName, isNull);
        expect(item.collectionSalePrice?[0].cvtDatetime, isNull);
        print('✅ 누락 필드 → null 처리됨');
      } catch (e) {
        fail('❌ 누락 필드 처리 실패: $e');
      }
    });

    test('5. 필드 타입 검증', () {
      print('------ 6단계: 필드 타입 검증 ------');
      try {
        final jsonMap = jsonDecode(jsonString);
        final response = CollectionChartDataResponse.fromJson(jsonMap);
        final first = response.collectionChartDataList.first;
        final firstSale = first.collectionSalePrice?.first;

        expect(first.collectionName is String, isTrue);
        expect(firstSale?.price is double, isTrue);
        expect(firstSale?.cvtDatetime is DateTime, isTrue);
        print('✅ 모든 주요 필드 타입 정상');
      } catch (e) {
        fail('❌ 타입 검증 실패: $e');
      }
    });

    test('6. JSON 재변환 변환 일치 여부', () {
      print('------ 7단계: round-trip 변환 검증 ------');
      try {
        final originalMap = jsonDecode(jsonString);
        final model = CollectionChartDataResponse.fromJson(originalMap);
        final regeneratedJson = jsonEncode(model.toJson());
        final regeneratedMap = jsonDecode(regeneratedJson);

        expect(regeneratedMap, equals(originalMap));
        print('✅ round-trip 변환 결과 완전 일치');
      } catch (e) {
        fail('❌ round-trip 일치 실패: $e');
      }
    });
  });
}
