import 'dart:io';
import 'dart:convert';
import '../model/stock_listing.dart';
import 'stock_data_source.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    // CSV 파일 경로
    final file = File('flutter-study/assignments/2025-03-31/data_source/listing_status.csv');
    
    // 파일 읽기
    final fileContent = await file.readAsString();
    
    // 파일을 줄별로 분리
    final lines = LineSplitter.split(fileContent).toList();
    
    // 첫 번째 줄은 헤더로 건너뜀
    final dataLines = lines.skip(1).toList();

    // 각 줄을 CSV로 파싱하여 StockListing 객체로 변환
    List<StockListing> stocks = [];
    for (var line in dataLines) {
      final fields = line.split(',');

      // `name`이 비어있지 않은 항목만 추가
      if (fields[1].isNotEmpty) {
        stocks.add(StockListing.fromCsv(fields));
      }
    }

    return stocks;
  }
}

void main() async {
  final stockDataSource = StockDataSourceImpl();

  try {
    final stocks = await stockDataSource.getStockListings();
    for (var stock in stocks) {
      print('Symbol: ${stock.symbol}');
      print('Name: ${stock.name}');
      print('Exchange: ${stock.exchange}');
      print('IPO Date: ${stock.ipoDate}');
      print('Status: ${stock.status}');
      print('---');
    }
  } catch (e) {
    print('Error: $e');
  }
}