import 'package:modu_3_dart_study/PR2025-03-31/model/stocklisting.dart';

abstract interface class StockDataSource {
  Future<List<StockListing>> getStockListings();
}
