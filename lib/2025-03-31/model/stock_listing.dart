class StockListing {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final DateTime ipoDate;
  final DateTime? delistingDate;
  final String status;

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    this.delistingDate,
    required this.status,
  });

  // JSON에서 StockListing 객체로 변환
  factory StockListing.fromCsv(List<String> fields) {
    return StockListing(
      symbol: fields[0],
      name: fields[1],
      exchange: fields[2],
      assetType: fields[3],
      ipoDate: DateTime.parse(fields[4]),
      delistingDate: fields[5] == 'null' ? null : DateTime.parse(fields[5]),
      status: fields[6],
    );
  }
}