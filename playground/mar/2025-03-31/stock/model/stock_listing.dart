class StockListing {
  String symbol;
  String? name;
  String exchange;
  String assetType;
  DateTime ipoDate;
  DateTime? delistingDate;
  String status;

  @override
  String toString() {
    return 'StockListing{symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status}';
  }

  StockListing({
    required this.symbol,
    this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    this.delistingDate,
    required this.status,
  });

  factory StockListing.fromCsv(String csvRow) {
    final data = csvRow.split(',');

    return StockListing(
      symbol: data[0],
      name: data[1],
      exchange: data[2],
      assetType: data[3],
      ipoDate: DateTime.parse(data[4]),
      delistingDate: DateTime.tryParse(data[5]),
      status: data[6],
    );
  }
}
