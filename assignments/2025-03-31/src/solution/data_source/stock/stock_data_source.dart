import '../../model/stock/stock.dart';

abstract interface class StockDataSource {
  Future<List<Stock>> getStockListings();
}
