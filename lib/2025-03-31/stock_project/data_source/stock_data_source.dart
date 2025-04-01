import 'package:modu_3_dart_study/2025-03-31/stock_project/model/stock.dart';

abstract class StockDataSource {
  Future<List<Stock>> getStocks();
}
