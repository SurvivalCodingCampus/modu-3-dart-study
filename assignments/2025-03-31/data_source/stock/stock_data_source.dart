import '../../model/stock/stock_model.dart';

abstract interface class StockDataSource {
  Future<List<Stock>> fetchStockList();
}
