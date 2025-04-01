import 'dart:io';

import '../model/stock_listing.dart';
import 'stock_data_source.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    final file = File('lib/2025-03-31/data/listing_status.csv');
    final lines = await file.readAsLines();

    final dataLines = lines.skip(1);
    final List<StockListing> listings = [];

    for (final line in dataLines) {
      final parts = line.split(',');

      if (parts.length >= 7 && parts[1].trim().isNotEmpty) {
        try {
          final listing = StockListing.fromCsv(line);
          listings.add(listing);
        } catch (e) {
          print('줄에 오류 발생: $e');
        }
      }
    }
    return listings;
  }
}
