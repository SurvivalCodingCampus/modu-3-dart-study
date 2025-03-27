import 'dart:convert';
import 'dart:io';

class CollectionChartData {
  final String collectionName;
  final List<SalePrice> collectionSalePrice;

  CollectionChartData(this.collectionName, this.collectionSalePrice);

  CollectionChartData.fromJson(Map<String, dynamic> json)
    : collectionName = json['collectionName'] ?? '알수없음',
      collectionSalePrice =
          (json['collectionSalePrice'] as List?)
              ?.map((e) => SalePrice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

  @override
  String toString() {
    return 'collectionName: $collectionName, collectionSalePrice: $collectionSalePrice';
  }
}

class SalePrice {
  final double price;
  final String cvtDatetime;
  SalePrice(this.price, this.cvtDatetime);

  SalePrice.fromJson(Map<String, dynamic> json)
    : price = (json['price'] as num?)?.toDouble() ?? 0.0,
      cvtDatetime = json['cvtDatetime'] ?? '';
}

class CollectionChartDataList {
  List<CollectionChartData> collectionChartDataList;

  CollectionChartDataList(this.collectionChartDataList);
  CollectionChartDataList.fromJson(Map<String, dynamic> json)
    : collectionChartDataList =
          // List 가 null 이면 map 실행 어려움 -> null 체크 필요
          (json['collectionChartDataList'] as List?)
              ?.map(
                (e) => CollectionChartData.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [];
}

void main() {
  const filePath =
      '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-26/json_data.json';
  const jsonPath =
      '/Users/hemu/dev/DartProject/modu-3-dart-study/assignments/2025-03-26';
  File file = File(filePath);
  if (!file.existsSync()) {
    print('파일이 존재하지 않습니다.');
    return;
  }
  try {
    String jsonString = file.readAsStringSync();
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final collectionChartDataList = CollectionChartDataList.fromJson(jsonData);
    File file2 = File('$jsonPath/json_data.dart');
    file2.writeAsStringSync(jsonString);
  } on FormatException {
    print('JSON 형식이 올바르지 않습니다.');
  }
}
