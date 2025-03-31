class StockListing {
  final String? symbol;
  final String? name;
  final String? exchange;
  final String? assetsType;
  final DateTime? ipoDate;
  final String? delistingDate;
  final String? status;

  StockListing({
    this.symbol,
    this.name,
    this.exchange,
    this.assetsType,
    this.ipoDate,
    this.delistingDate,
    this.status,
  });

  factory StockListing.fromCsv(List<String> values) {
    if (values[1].isEmpty || values[1] == "null") {
      return StockListing(
        symbol: values[0],
        name: 'Anonymity',
        exchange: values[2],
        assetsType: values[3],
        ipoDate: DateTime.tryParse(values[4]),
        delistingDate: values[5],
        status: values[6],
      );
    }
    return StockListing(
      symbol: values[0],
      name: values[1],
      exchange: values[2],
      assetsType: values[3],
      ipoDate: DateTime.tryParse(values[4]),
      delistingDate: values[5],
      status: values[6],
    );
  }

  @override
  String toString() {
    return 'StockListing(symbol: $symbol, name: $name, exchange: $exchange, assetsType: $assetsType, '
        'ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status)';
  }
}
