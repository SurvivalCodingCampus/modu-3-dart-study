import 'package:test/test.dart';

import '../../../../assignments/2025-03-31/src/solution/stock.dart';
import '../../../../assignments/2025-03-31/src/solution/stock_data_source_impl.dart';

void main() {
  group('Stock', () {
    test('StockDataSourceImpl.getStockListings', () async {
      final stocks = await StockDataSourceImpl().getStockListings();

      expect(stocks, isA<List<Stock>>());
      for (var stock in stocks) {
        expect(stock, isA<Stock>());
      }
    });

    test('역직렬화 - 값이 다 없는 Stock', () {
      final result = Stock.fromCsv(null);

      expect(result, isA<Stock>());
    });

    test('역직렬화 - name이 null인 Stock', () {
      final result = Stock.fromCsv('AMEH,,NASDAQ,Stock,2024-02-26,null,Active');

      expect(result, isA<Stock>());
    });

    test('역직렬화 - 값이 다 있는 Stock', () {
      final result = Stock.fromCsv(
        'A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active',
      );

      expect(result, isA<Stock>());
    });
  });
}
