import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource{

  @override
  Future<List<StockListing>> getStockListings() async {
    List<StockListing> list = [];
    final File file = File('lib/2025-03-31/listing_status.csv');
    final List<String> rows = file.readAsLinesSync();

    for (final row in rows) {
      final List<String?> values = row.split(',');
      if (values[1] != 'null') {
        list.add(StockListing.fromCsv(row));
      }
    }
    return list;
  }
}

void main() async {
  List<StockListing> stockListing = await StockDataSourceImpl().getStockListings();
  print(stockListing);
}