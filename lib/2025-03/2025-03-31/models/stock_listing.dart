class StockListing {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final DateTime ipoDate;
  final DateTime? delistingDate;
  final bool active;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.active,
  });

  factory StockListing.fromCsv(List<String> csv) {
    return StockListing(
      symbol: csv[0],
      name: csv[1],
      exchange: csv[2],
      assetType: csv[3],
      ipoDate: DateTime.parse(csv[4]),
      delistingDate: DateTime.tryParse(csv[5]),
      active: csv[6] == 'ACTIVE' ? true : false,
    );
  }

  @override
  String toString() {
    return 'StockListing(symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, status: $active)';
  }
}
