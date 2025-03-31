import 'dart:io';

import 'stock_data_source.dart';
import 'stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  final String path;

  StockDataSourceImpl({required this.path});

  @override
  Future<List<StockListing>> getStockListings() async {
    File csv = File(path);
    List<StockListing> stockListings = [];
    try {
      final lines = await csv.readAsLines();
      for (final line in lines.sublist(1)) {
        final dataList = line.split(',');
        stockListings.add(StockListing.fromCsv(dataList));
      }
      return stockListings;
    } catch (e) {
      throw UnimplementedError();
    }
  }
}