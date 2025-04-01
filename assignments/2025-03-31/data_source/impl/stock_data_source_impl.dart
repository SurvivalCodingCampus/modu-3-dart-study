import 'dart:io';

import '../../model/stock.dart';
import '../stock_data_source.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<Stock>> getStocksFromFile(String fileName) async {
    try {
      File stockFile = File(fileName);
      final List<Stock> stocks = [];
      final List<String> stockStream = await stockFile.readAsLines();
      stockStream.removeAt(0);

      for (final String stockData in stockStream) {
        stocks.add(Stock.fromCsv(stockData));
      }

      return stocks.where((element) => element.name != '').toList();
    } on PathNotFoundException {
      throw ArgumentError('파일을 찾을 수 없습니다.');
    } on FormatException {
      throw ArgumentError('csv 형식에 맞는 데이터를 넣어주세요.');
    }
  }
}
