
import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';
import 'package:test/test.dart';

void main() {
  final stockDataSource = StockDataSourceImpl();

  test('4번 문제', () async {
    final List<StockListing> stockListings = await stockDataSource.getStockListings();

    expect(stockListings.any((e) => e.name?.isEmpty ?? true), isFalse);


  });
}