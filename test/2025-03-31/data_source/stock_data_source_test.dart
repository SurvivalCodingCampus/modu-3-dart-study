import 'package:modu_3_dart_study/2025-03-31/models/stock_listing.dart';
import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source.dart';

void main() {
  group('StockDataSourceImpl - 과제 4', () {
    final dataSource = StockDataSourceImpl();

    test('getStockListings()는 StockListing 객체의 리스트로 반환되어야 한다', () async {
      final List<StockListing> stockListings = await dataSource.getStockListings();

      // 반환된 stockListings 리스트를 출력해서 데이터 상태를 확인
      for (var stock in stockListings) {
        stock.debugPrint(); // debugPrint 추가하여 각 객체 출력
      }

      // StockListings가 비지 않는지 확인
      expect(stockListings, isNotEmpty);
      expect(stockListings.length, greaterThan(1));

      // 첫 번째 StockListing 객체의 필드가 null이 아님을 확인
      expect(stockListings.first.symbol, isNotNull);
      expect(stockListings.first.name, isNotNull);
      expect(stockListings.first.exchange, isNotNull);
      expect(stockListings.first.assetType, isNotNull); // assetType 확인
      expect(stockListings.first.status, isNotNull); // status 확인
    });

    test('getStockListings()는 StockListing 객체를 CSV로 직렬화 할 수 있어야 한다', () async {
      final List<StockListing> stockListings = await dataSource.getStockListings();

      // 첫 번째 StockListing 객체를 CSV로 직렬화한 후, 출력문 확인
      final stockListingCsvRow = stockListings.first.toCsvRow();
      // 직렬화된 데이터가 출력됩니다.
      expect(stockListingCsvRow, contains(stockListings.first.symbol));
      expect(stockListingCsvRow, contains(stockListings.first.name));
    });
  });
}
