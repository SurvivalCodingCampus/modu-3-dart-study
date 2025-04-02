class Stock {
  final String symbol;
  final String name;
  final String exchange;
  final String assetType;
  final DateTime ipoDate;
  final dynamic delistingDate;
  final String status;

  Stock({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  factory Stock.fromCsv(String data) {
    final splitedData = data.split(',');
    final symbol = splitedData[0];
    final name = splitedData[1];
    final exchange = splitedData[2];
    final assetType = splitedData[3];
    final ipoDate = DateTime.parse(splitedData[4]);
    final delistingDate = splitedData[5];
    final status = splitedData[6];
    return Stock(
      symbol: symbol,
      name: name,
      exchange: exchange,
      assetType: assetType,
      ipoDate: ipoDate,
      delistingDate: delistingDate,
      status: status,
    );
  }
}
