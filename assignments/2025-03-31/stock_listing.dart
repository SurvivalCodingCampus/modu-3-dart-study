class StockListing {
  String symbol;
  String name;
  String exchange;
  String assetType;
  DateTime? ipoDate;
  DateTime? delistingDate;
  String status;
  StockListing({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    this.ipoDate,
    this.delistingDate,
    required this.status,
  });

  factory StockListing.fromCsv(List<String> dataList) {
    return StockListing(
      symbol: dataList[0],
      name: dataList[1],
      exchange: dataList[2],
      assetType: dataList[3],
      ipoDate: DateTime.tryParse(dataList[4]),
      delistingDate: DateTime.tryParse(dataList[5]),
      status: dataList[6],
    );
  }
}