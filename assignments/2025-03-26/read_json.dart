import 'dart:convert';
import 'dart:io';

// 기존에 정의한 클래스들
class CollectionChartData {
  final String collectionName;
  final List<CollectionSalePrice> collectionSalePrice;

  CollectionChartData({required this.collectionName, required this.collectionSalePrice});

  // fromJson 제거하고, 생성자 내에서 JSON 처리d
  CollectionChartData.fromJson(Map<String, dynamic> json)
      : collectionName = json['collectionName'] ?? '', // null일 경우 빈 문자열
        collectionSalePrice = (json['collectionSalePrice'] as List?)
                ?.map((item) => CollectionSalePrice.fromJson(item))
                .toList() ??
            []; // null일 경우 빈 리스트 처리
}

class CollectionSalePrice {
  final double price;
  final String cvtDatetime;

  CollectionSalePrice({required this.price, required this.cvtDatetime});

  // fromJson 제거하고, 생성자 내에서 JSON 처리
  CollectionSalePrice.fromJson(Map<String, dynamic> json)
      : price = json['price'] ?? 0.0, // null인 경우 기본값 0.0
        cvtDatetime = json['cvtDatetime'] ?? ''; // null인 경우 빈 문자열
}

class ChartData {
  final List<CollectionChartData> collectionChartDataList;

  ChartData({required this.collectionChartDataList});

  // fromJson 제거하고, 생성자 내에서 JSON 처리
  ChartData.fromJson(Map<String, dynamic> json)
      : collectionChartDataList = (json['collectionChartDataList'] as List?)
                ?.map((item) => CollectionChartData.fromJson(item))
                .toList() ??
            []; // null인 경우 빈 리스트 처리
}

// JSON 파일을 동기적으로 읽어오기 및 역직렬화
void main() {
  try {
    // 파일 경로를 지정
    final file = File('assignments/2025-03-26/chart_data.json');

    // 파일을 동기적으로 읽어서 JSON 문자열로 변환
    String jsonString = file.readAsStringSync();

    // JSON 문자열을 파싱하여 Map<String, dynamic> 형태로 변환
    Map<String, dynamic> jsonData = jsonDecode(jsonString);

    // ChartData 객체로 변환
    ChartData chartData = ChartData.fromJson(jsonData);

    // 변환된 데이터 출력
    chartData.collectionChartDataList.forEach((collection) {
      print('Collection Name: ${collection.collectionName}');
      collection.collectionSalePrice.forEach((salePrice) {
        print('Price: ${salePrice.price}, Datetime: ${salePrice.cvtDatetime}');
      });
    });

  } catch (e) {
    print('Error reading file: $e');
  }
}