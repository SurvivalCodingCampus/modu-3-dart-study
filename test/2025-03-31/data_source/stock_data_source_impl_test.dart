import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';
import 'package:modu_3_dart_study/modu_3_dart_study.dart';
import 'package:test/test.dart';

void main() {
  test('과제4 StockListing 테스트', () async {
    final List<StockListing> list = await StockDataSourceImpl().getStockListings();
    expect(list, isA<List<StockListing>>());
    expect(list.any((stock) => stock.name == null || stock.name == 'null'), isFalse);
    expect(list.any((stock) => stock.symbol == null || stock.symbol == 'null'), isFalse);
    expect(list.any((stock) => stock.delistingDate == null || stock.delistingDate == 'null'), isFalse);
    expect(list.any((stock) => stock.exchange == null || stock.exchange == 'null'), isFalse);
    expect(list.any((stock) => stock.ipoDate == null || stock.ipoDate == 'null'), isFalse);
    expect(list.any((stock) => stock.assetType == null || stock.assetType == 'null'), isFalse);
    expect(list.any((stock) => stock.status == null || stock.status == 'null'), isFalse);
  });
}
