import '../2025-03-25/default_file_operations.dart';
import '../2025-03-25/file_operation.dart';
import 'stock_data_source.dart';
import 'stock_listing.dart';

class StockDataSourceImpl implements StockDataSource {
  static const stockListingPath = 'assignment/2025-03-31/listing_status.csv';

  final FileOperation _fileOperation;

  FileOperation get fileOperation => _fileOperation;

  StockDataSourceImpl({FileOperation? fileOperation})
      : _fileOperation = fileOperation ?? DefaultFileOperations();

  @override
  Future<List<StockListing>> getStockListings() async {
    final rawCsv = await fileOperation.readAsLinesAsync(stockListingPath);
    final List<StockListing> stockListings = [];

    for (int i = 1; i < rawCsv.length; i++) {
      final line = rawCsv[i];
      final stockListing = StockListing.fromCsv(line);
      stockListings.add(stockListing);
    }

    return stockListings;
  }
}