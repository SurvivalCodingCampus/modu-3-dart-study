import 'package:intl/intl.dart';

class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  DateTime ipoDate;
  String? delistingDate;
  String status;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    this.delistingDate,
    required this.status,
  });

  factory StockListing.fromCsv(List<String> values) {
    return StockListing(
      symbol: values[0],
      name: values[1],
      exchange: values[2],
      assetType: values[3],
      ipoDate: DateFormat('yyyy-MM-dd').parse(values[4]),
      delistingDate: values[5] == 'null' ? null : values[5],
      status: values[6],
    );
  }

  @override
  String toString() {
    return 'StockListing(symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status)';
  }
}
