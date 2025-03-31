import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/solution4/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/solution4/model/stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    String path = 'lib/2025-03-31/solution4/data_source/listing_status.csv';
    List<StockListing> stockList = [];
    File(path)
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .forEach((items) {
          stockList.add(StockListing.fromCSV(items));
        });

    return stockList;
  }
}
