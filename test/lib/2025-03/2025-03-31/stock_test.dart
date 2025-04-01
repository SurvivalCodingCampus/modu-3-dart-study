import 'package:modu_3_dart_study/2025-03/2025-03-31/data_sources/stock/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-31/data_sources/stock/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03/2025-03-31/models/stock_listing.dart'
    show StockListing;

import 'package:test/test.dart';

void main() {
  const String path = '/lib/data/stocks.csv';
  final StockDataSource dataSource = StockDataSourceImpl();

  test('stocks.csv를 데이터소스 구현체를 통해 역직렬화 해야한다.', () async {
    List<StockListing> list = await dataSource.getStockListings(path);

    expect(list, isA<List<StockListing>>());
    expect(list[0].symbol, equals('A'));
    expect(list.last.symbol, equals('ZZZ'));
  });
}
