
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}