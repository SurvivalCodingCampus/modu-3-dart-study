import 'dart:io';

import '../../model/stock/stock.dart';
import 'stock_data_source.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<Stock>> getStockListings() async {
    final file =
        await File(
          'assignments/2025-03-31/src/solution/stock.csv',
        ).readAsString();

    final datas = file.split('\n');

    if (datas.isNotEmpty) {
      datas.removeAt(0);
    }

    return datas.map((e) => Stock.fromCsv(e)).toList();
  }
}
