import 'package:modu_3_dart_study/PR2025-03-31/data_source4/stock_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  test('stock csv의 마지막 객체 확인 test', () async {
    final stockData = StockDataSourceImpl();
    final stocks = await stockData.getStockListings();
    expect(stocks.last.symbol, equals('ZZZ'));
    expect(stocks.last.name, equals('TEST TICKER FOR UTP'));
    expect(stocks.last.exchange, equals('NYSE ARCA'));
    expect(stocks.last.assetType, equals('Stock'));
    expect(stocks.last.ipoDate, equals('2014-10-31'));
    expect(stocks.last.status, equals('Active'));
  });
}
