import 'package:test/test.dart';
import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';

void main() {
  test('4. csv test', () async {

    final csvData = StockDataSourceImpl();

    final csvLine = await csvData.getStockListings();

    expect(csvLine, isA<List<StockListing>>());
    expect(csvLine.length, greaterThan(0));

    final first = csvLine.first;

    expect(first.symbol, equals('A'));
    expect(first.name, equals('Agilent Technologies Inc'));
    expect(first.exchange, equals('NYSE'));
    expect(first.assetType, equals('Stock'));
    expect(first.ipoDate, equals('1999-11-18'));
    expect(first.delistingDate, isNull);
    expect(first.status, equals('Active'));
  });
}
