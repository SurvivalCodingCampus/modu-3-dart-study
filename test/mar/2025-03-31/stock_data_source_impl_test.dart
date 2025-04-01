import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../playground/mar/2025-03-31/stock/data_source/stock_data_source_impl.dart';
import '../../../playground/mar/2025-03-31/stock/model/stock_listing.dart';

void main() {
  test('stock', () async {
    final stockData = StockDataSourceImpl();
    final stock = await stockData.getStockListings();

    int len = stock.length + StockDataSourceImpl.cnt;
    
    expect(stock, isA<List<StockListing>>());
    expect(len, equals(11831));
  });
}
