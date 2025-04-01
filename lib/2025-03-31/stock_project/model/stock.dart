class Stock {
  final String symbol; //종목
  final String? name; //회사이름
  final String exchange; // 거래소
  final String assetType; //자산 유형
  final String ipoDate; //상장일
  final String? delistingDate; //상장 폐지일
  final String status; //상태

  Stock({
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.assetType,
    required this.ipoDate,
    required this.delistingDate,
    required this.status,
  });

  factory Stock.fromCsv(List<String> csvRow) {
    return Stock(
      symbol: csvRow[0],
      name: csvRow[1],
      exchange: csvRow[2],
      assetType: csvRow[3],
      ipoDate: csvRow[4],
      delistingDate: csvRow[5] == 'null' ? null : csvRow[5],
      //delistingDate가 'null'이면 null 처리
      status: csvRow[6],
    );
  }
}
