import 'stock_iisting.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}
