import 'dart:io';
import '../models/stock_listing.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}

class StockDataSourceImpl implements StockDataSource {
  final String csvPath = 'lib/2025-03-31/data/listing_status.csv';

  StockDataSourceImpl();

  @override
  Future<List<StockListing>> getStockListings() async {
    try {
      // 파일을 읽어 문자열로 가져옵니다.
      final String csvString = await File(csvPath).readAsString();

      // 문자열을 "\n" 기준으로 나눠서 각 라인들을 분리합니다.
      final List<String> lines = csvString.split("\n").skip(1).toList(); // 첫 번째 라인(헤더)은 건너뜁니다.

      final List<StockListing> listings = <StockListing>[];

      // 각 라인에 대해 처리합니다.
      for (final String line in lines) {
        if (line.isEmpty) continue; // 빈 줄은 무시합니다.

        try {
          final StockListing? stock = StockListing.fromCsv(line);

          // stock이 null이 아니고, 유효한 항목이 있으면 리스트에 추가
          if (stock != null && stock.name != null && stock.symbol != null) {
            listings.add(stock); // stock이 null이 아니면 추가
          }
        } catch (_) {
          continue; // 예외가 발생하면 해당 항목을 건너뜁니다.
        }
      }

      return listings;
    } catch (e) {
      print('getStockListings 실패: $e');
      return [];
    }
  }
}
