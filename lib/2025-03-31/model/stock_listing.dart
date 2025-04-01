class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String ipoDate;
  String delistingDate;
  String status;

  factory StockListing.fromCsv(String csvRow) {
    final List<String> values = csvRow.split(','); // 쉼표 기준 분할
    return StockListing(
        symbol: values[0] == 'null' ? '' : values[0],
        name: values[1] == 'null' ? '' : values[1],
        exchange: values[2] == 'null' ? '' : values[2],
        assetType: values[3] == 'null' ? '' : values[3],
        ipoDate: values[4] == 'null' ? '' : values[4],
        delistingDate: values[5] == 'null' ? '' : values[5],
        status: values[6] == 'null' ? '' : values[6]
    );
  }

  StockListing(
      {required this.symbol, required this.name, required this.exchange, required this.assetType,
        required this.ipoDate, required this.delistingDate, required this.status});

  @override
  String toString() {
    return 'StockListing{symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status}';
  }
}