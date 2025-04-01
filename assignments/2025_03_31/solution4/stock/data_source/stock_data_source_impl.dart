import 'dart:io';

import '../stock_listing.dart';
import 'stock_data_source.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    final csvFile = File('assets/csv/listing_status.csv');
    List<String> csvLines = await csvFile.readAsLines();

    List<String> stockList = csvLines.skip(1).toList();

    List<StockListing> stocks =
        stockList
            .map((line) {
              List<String> values = line.split(',');

              return StockListing.fromCsv(List.from(values));
            })
            .where((e) => e.name?.isNotEmpty ?? false)
            .toList();

    return stocks;
  }
}
