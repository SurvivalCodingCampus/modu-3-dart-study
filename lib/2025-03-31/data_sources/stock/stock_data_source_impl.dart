import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/data_sources/stock/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/models/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  static final String root = Directory.current.path;

  @override
  Future<List<StockListing>> getStockListings(String relativePath) async {
    File file = File(root + relativePath);
    List<String> csv = await file.readAsLines();

    return csv
        .skip(1)
        .map((String e) => e.split(','))
        .where((e) => e[1].isNotEmpty)
        .map((e) => StockListing.fromCsv(e))
        .toList();
  }
}
