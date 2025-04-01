class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  String status;

  @override
  String toString() {
    // TODO: implement toString
    return 'StockListing{"symbol" : $symbol, "name" : $name, "exchange" : '
        '$exchange, "assetType" : $assetType, "status" : $status }';
  }

  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.status,
  });

  factory StockListing.fromCSV(String csvRow) {
    List csvRowList = csvRow.split(',');
    return StockListing(
      symbol: csvRowList.first,
      name: csvRowList[1] ?? '',
      exchange: csvRowList[2],
      assetType: csvRowList[3],
      status: csvRowList.last,
    );
  }
}
