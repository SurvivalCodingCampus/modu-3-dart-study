import 'package:intl/intl.dart';

class StockListing {
  static const List<String> indexes = [
    'symbol',
    'name',
    'exchange',
    'assetType',
    'ipoDate',
    'delistingDate',
    'status',
  ];
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
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  factory StockListing.fromCsv(String csvRow) {
    final columns = csvRow.split(',');

    final symbol = columns[0] as String? ?? 'No Data';
    final name = columns[1] as String? ?? 'No Data';
    final exchange = columns[2] as String? ?? '';
    final assetType = columns[3] as String? ?? '';
    final ipoDate = DateTime.tryParse(columns[4] as String? ?? '');
    final delistingDate = DateTime.tryParse(columns[5] as String? ?? 'No Data');
    final status = columns[6] as String? ?? '';

    return StockListing(
      symbol: symbol,
      name: name,
      exchange: exchange,
      assetType: assetType,
      ipoDate: ipoDate,
      delistingDate: delistingDate,
      status: status,
    );
  }

  String toCsvRow() {
    final tmpIpoDate = ipoDate;
    final ipoDateToString =
        tmpIpoDate != null
            ? DateFormat('yyyy-MM-dd').format(tmpIpoDate)
            : 'null';
    final tmpDelistingDate = delistingDate;
    final delistinngDateToString =
        tmpDelistingDate != null
            ? DateFormat('yyyy-MM-dd').format(tmpDelistingDate)
            : 'null';

    return [
      symbol,
      name,
      exchange,
      assetType,
      ipoDateToString,
      delistinngDateToString,
      status,
    ].join(',');
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StockListing &&
          runtimeType == other.runtimeType &&
          symbol == other.symbol &&
          name == other.name &&
          exchange == other.exchange &&
          assetType == other.assetType &&
          ipoDate == other.ipoDate &&
          delistingDate == other.delistingDate &&
          status == other.status;

  @override
  int get hashCode =>
      symbol.hashCode ^
      name.hashCode ^
      exchange.hashCode ^
      assetType.hashCode ^
      ipoDate.hashCode ^
      delistingDate.hashCode ^
      status.hashCode;
}
