class StockListing {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final String ipoDate;
  final String? delistingDate;
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

  factory StockListing.fromCsv(String csvRow) {
    final values = csvRow.split(',');

    if (values.length < 7 || values[1].trim().isEmpty) {
      throw Exception('빈 글자: $csvRow');
    }

    return StockListing(
      symbol: values[0],
      name: values[1],
      exchange: values[2],
      assetType: values[3],
      ipoDate: values[4],
      delistingDate: values[5] == 'null' ? null : values[5],
      status: values[6],
    );
  }

  @override
  String toString() {
    return 'StockListing(symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: ${delistingDate ?? ''}, status: $status)';
  }
}
