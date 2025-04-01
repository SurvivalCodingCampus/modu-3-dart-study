import 'package:test/test.dart';

import '../../../../assignments/2025-03-31/src/solution/data_source/stock/stock_data_source_impl.dart';
import '../../../../assignments/2025-03-31/src/solution/model/stock/stock.dart';

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
      expect(result.symbol, equals(null));
      expect(result.name, equals(null));
      expect(result.exchange, equals(null));
      expect(result.assetType, equals(null));
      expect(result.ipoDate, equals(null));
      expect(result.delistingDate, equals(null));
      expect(result.status, equals(null));
    });

    test('역직렬화 - name이 null인 Stock', () {
      final result = Stock.fromCsv('AMEH,,NASDAQ,Stock,2024-02-26,null,Active');

      expect(result, isA<Stock>());
      expect(result.symbol, equals('AMEH'));
      expect(result.name, equals('')); // name이 null이므로 빈 문자열 또는 기본값 확인
      expect(result.exchange, equals('NASDAQ'));
      expect(result.assetType, equals('Stock'));
      expect(result.ipoDate, equals('2024-02-26'));
      expect(result.delistingDate, equals('null'));
      expect(result.status, equals('Active'));
    });

    test('역직렬화 - 값이 다 있는 Stock', () {
      final result = Stock.fromCsv(
        'A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,null,Active',
      );

      expect(result, isA<Stock>());
      expect(result.symbol, equals('A'));
      expect(result.name, equals('Agilent Technologies Inc'));
      expect(result.exchange, equals('NYSE'));
      expect(result.assetType, equals('Stock'));
      expect(result.ipoDate, equals('1999-11-18'));
      expect(result.delistingDate, equals('null'));
      expect(result.status, equals('Active'));
    });
  });
}
