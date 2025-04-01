import 'dart:io';

import '../model/stock_listing.dart';
import 'stock_data_source.dart';

class StockDataSourceImpl implements StockDataSource {
  static int cnt = 0;

  @override
  Future<List<StockListing>> getStockListings() async {
    final stockFile = File(r'playground/mar/2025-03-31/stock/stock.csv');
    final stockString = await stockFile.readAsLines();
    final dataStock = stockString.skip(1);

    final result = <StockListing>[];

    for (final datas in dataStock) {
      final data = datas.split(',');

      if (data[1] != '') {
        result.add(StockListing.fromCsv(datas));
      } else {
        cnt++;
      }
    }

    return result;
  }
}

void main() async {
  final stockData = StockDataSourceImpl();
  final stock = await stockData.getStockListings();
  print('총 개수: ${stock.length}');
  print('스킵된 줄 수: ${StockDataSourceImpl.cnt}');
}
