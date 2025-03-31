import '../enums/asset_type.dart';
import '../enums/exchange_type.dart';

class Stock {
  final String symbol;
  final String name;
  final ExchangeType exchange;
  final AssetType assetType;
  final DateTime ipoDate;
  final DateTime? delistingDate;
  final bool status;

  const Stock({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    this.delistingDate,
    required this.status,
  });

  factory Stock.fromCsv(String csvRow) {
    final List<String> csvData = csvRow.split(',');

    return Stock(
      symbol: csvData[0],
      name: csvData[1],
      exchange: ExchangeType.fromString(csvData[2]),
      assetType: AssetType.fromString(csvData[3]),
      ipoDate: DateTime.parse(csvData[4]),
      delistingDate: csvData[5] != 'null' ? DateTime.parse(csvData[5]) : null,
      status: csvData[6] == 'Active' ? true : false,
    );
  }
}
