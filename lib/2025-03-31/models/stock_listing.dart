class StockListing {
  final String? symbol;
  final String? name;
  final String? exchange;
  final String? assetType;
  final DateTime? ipoDate;
  final DateTime? delistingDate;
  final String? status;

  StockListing({
    this.symbol,
    this.name,
    this.exchange,
    this.assetType,
    this.ipoDate,
    this.delistingDate,
    this.status,
  });

  // 기존의 _invalid() 메서드는 그대로 두고, toCsvRow() 수정
  factory StockListing.fromCsv(String line) {
    final values = line.split(',');

    if (values.length < 7 || values[1].trim().isEmpty) {
      return StockListing._invalid();
    }

    return StockListing(
      symbol: values[0].trim(),
      name: values[1].trim(),
      exchange: values[2].trim(),
      assetType: values[3].trim().isEmpty ? null : values[3].trim(),
      ipoDate: _parseDate(values[4].trim()),
      delistingDate: _parseDate(values[5].trim()),
      status: values[6].trim().isEmpty ? null : values[6].trim(),
    );
  }

  static DateTime? _parseDate(String date) {
    if (date.isEmpty) return null;
    try {
      return DateTime.parse(date);
    } catch (e) {
      return null;
    }
  }

  // CSV 직렬화 처리 전에 debugPrint 추가
  String toCsvRow() {
    final csvRow =
        '$symbol,$name,$exchange,$assetType,${ipoDate?.toIso8601String() ?? ''},${delistingDate?.toIso8601String() ?? ''},$status';

    // 직렬화된 데이터 출력
    print('CSV 직렬화: $csvRow'); // 여기에 출력문 추가
    return csvRow;
  }

  void debugPrint() {
    print(
      'StockListing { symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status }',
    );
    print('========================================');
  }

  // 유효하지 않은 객체를 처리하기 위한 private 생성자
  StockListing._invalid()
    : symbol = null,
      name = null,
      exchange = null,
      assetType = null,
      ipoDate = null,
      delistingDate = null,
      status = null;
}
