import 'package:test/test.dart';

import '../../assignments/2025-03-31/stock_data_source_impl.dart';
import '../../assignments/2025-03-31/stock_listing.dart';

void main() {
  test('Stock getStockListings 메소드 테스트', () async {
    String path = 'assignments/2025-03-31/listing_status.csv';
    StockDataSourceImpl stockDataSourceImpl = StockDataSourceImpl(path: path);
    List<StockListing> stockListinglist =
        await stockDataSourceImpl.getStockListings();

    expect(stockListinglist[0].symbol == 'A', isTrue);
    expect(stockListinglist[0].name == 'Agilent Technologies Inc', isTrue);
    expect(stockListinglist[0].exchange == 'NYSE', isTrue);
    expect(stockListinglist[0].assetType == 'Stock', isTrue);
    expect(stockListinglist[0].ipoDate == DateTime(1999, 11, 18), isTrue);
    expect(stockListinglist[0].delistingDate == null, isTrue);
    expect(stockListinglist[0].status == 'Active', isTrue);
  });
}