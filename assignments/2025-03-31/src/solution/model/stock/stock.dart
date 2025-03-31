// ignore_for_file: public_member_api_docs, sort_constructors_first

class Stock {
  String? symbol;
  String? name;
  String? exchange;
  String? assetType;
  String? ipoDate;
  String? delistingDate;
  String? status;

  Stock({
    this.symbol,
    this.name,
    this.exchange,
    this.assetType,
    this.ipoDate,
    this.delistingDate,
    this.status,
  });

  factory Stock.fromCsv(String? csvRow) {
    List<String> result = csvRow?.split(',') ?? [];

    if (result.isEmpty) {
      // 빈 리스트인 경우 기본값으로 Stock 객체 생성
      return Stock(
        symbol: null,
        name: null,
        exchange: null,
        assetType: null,
        delistingDate: null,
        ipoDate: null,
        status: null,
      );
    }

    return Stock(
      symbol: result[0],
      name: result.length > 1 ? result[1] : null,
      exchange: result.length > 2 ? result[2] : null,
      assetType: result.length > 3 ? result[3] : null,
      delistingDate: result.length > 4 ? result[4] : null,
      ipoDate: result.length > 5 ? result[5] : null,
      status: result.length > 6 ? result[6] : null,
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return '{symbol: $symbol, name: $name, exchange: $exchange, assetType: $assetType, ipoDate: $ipoDate, delistingDate: $delistingDate, status: $status}';
  }
}
