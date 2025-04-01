// fromCsv(String csvRow) 형태의 factory 생성자를 작성할 것
// 단, 문제가 있는 항목(name 이 빈 항목)은 제외할 것

import 'dart:convert';
import 'dart:io';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

class StockData implements StockDataSource {
  final String filePath;
  StockData(this.filePath);
  @override
  Future<List<StockListing>> getStockListings() async {
    final file = File(filePath);
    final csvString = await file.readAsString();
    final List<String> rows = csvString.split('\n');
    rows.removeAt(0); // 헤더 제거
    rows.removeWhere((row) => row.isEmpty);
    final List<StockListing> stockListings = [];
    for (var row in rows) {
      try {
        // 예외가 아닐 때만 추가( name 이나 다른 곳이 빈칸이 되면 인덱스 번호가 달라짐. -> 제외)
        final value = StockListing.fromCsv(row);
        stockListings.add(value);
      } catch (e) {
        print('error row: $row');
        print('error: $e');
      }
    }
    return stockListings;
  }
}

class StockListing {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final DateTime ipoDate;
  final String delistingDate;
  final String status;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });
  factory StockListing.fromCsv(String csvRow) {
    final value = csvRow.split(','); // ,를 기준으로 나눔
    if (value.length < 7) {
      throw Exception('Invalid CSV row: $csvRow');
    }
    return StockListing(
      symbol: value[0].trim(),
      name: value[1].trim(),
      exchange: value[2].trim(),
      assetType: value[3].trim(),
      ipoDate: DateTime.parse(value[4].trim()),
      delistingDate: value[5].trim(),
      status: value[6].trim(),
    );
  }
  @override
  String toString() {
    return 'StockListing(symbol: $symbol, name: $name, exchange: $exchange, '
        'assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, '
        'status: $status)';
  }
}

void main() async {
  final dataSource = StockData(
    '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/listing_status.csv',
  );
  final stockListings = await dataSource.getStockListings();
  for (var stockListing in stockListings) {
    print(stockListing);
  }
}
