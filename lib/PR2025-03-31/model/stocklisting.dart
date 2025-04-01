import 'dart:convert';

class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String ipoDate;
  String status;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
      'exchange': exchange,
      'assetType': assetType,
      'ipoDate': ipoDate,
      'status': status,
    };
  }

  factory StockListing.fromCsv(List<dynamic> row) {
    return StockListing(
      symbol: row[0] ?? '',
      name: row[1] ?? '',
      exchange: row[2] ?? '',
      assetType: row[3] ?? '',
      ipoDate: row[4] ?? '',
      status: row[6] ?? '',
    );
  }

  @override
  String toString() {
    return 'StockListing{symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, status: $status}';
  }
}
