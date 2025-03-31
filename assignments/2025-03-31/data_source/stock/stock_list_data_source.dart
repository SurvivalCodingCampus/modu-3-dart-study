import '../../model/stock/stock_model.dart';

abstract interface class StockListDataSource {
  Future<List<Stock>> fetchStockList();
}
