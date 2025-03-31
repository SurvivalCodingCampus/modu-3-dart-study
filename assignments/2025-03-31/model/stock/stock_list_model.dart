import 'stock_model.dart';

class StockList {
  final List<Stock> list;

  StockList({required this.list});

  factory StockList.fromCsv(List<String> data) {
    final list = data.map((e) => Stock.fromCsv(e)).toList();
    return StockList(list: list);
  }
}
