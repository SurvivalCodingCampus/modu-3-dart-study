import 'package:test/test.dart';

import 'package:modu_3_dart_study/assignments/2025-03-31/stock_solution/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/assignments/2025-03-31/stock_solution/stock_iisting.dart';

void main() {
  group('StockDataSource_cvs', () {
    final dataSource = StockDataSourceImpl();

    test('getStockListings()', () async {
      final List<StockListing> stockListings =
          await dataSource.getStockListings();

      expect(stockListings, isNotEmpty);

      for (var stock in stockListings) {
        expect(stock.symbol, isNotNull);
        expect(stock.name, isNotNull);
        expect(stock.name, isNotEmpty); // name이 비어있지 않음 확인
        expect(stock.exchange, isNotNull);
        expect(stock.assetType, isNotNull);
        expect(stock.status, isNotNull);
      }
    });
  });
}
