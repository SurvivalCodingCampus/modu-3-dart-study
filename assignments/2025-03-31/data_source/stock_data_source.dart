import '../model/stock.dart';

abstract interface class StockDataSource {
  Future<List<Stock>> getStocksFromFile(String fileName);
}
