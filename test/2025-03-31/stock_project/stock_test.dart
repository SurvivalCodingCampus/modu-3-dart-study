import 'package:modu_3_dart_study/2025-03-31/stock_project/data_source/file_stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/stock_project/model/stock.dart';
import 'package:test/test.dart';



void main() async {
  group('[ CSV 파싱 ] - ', ()
  {
    test('CSV 데이터를 정확하게 로딩하고 파싱해야 한다', () async {
      final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/stock_project/';
      final fileStockDataSource = FileStockDataSource(filePath + 'listing_status.csv');
      final List<Stock> stocks = await fileStockDataSource.getStocks();

      //expect(stocks.length, 2); // 데이터 2개가 존재해야 함
      expect(stocks[0].symbol, 'A'); // 첫 번째 심볼이 'A'인지 확인
      expect(stocks[0].name,
          'Agilent Technologies Inc'); // 두 번째 회사 이름이 'Agilent Technologies Inc'인지 확인
    });

    test('name이 null이면 해당 행을 제외해야 한다', () {
      final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/stock_project/';
      final fileStockDataSource = FileStockDataSource(filePath + 'listing_status.csv');

      final csv = '''
symbol,name,exchange,assetType,ipoDate,delistingDate,status
A,Agilent Technologies Inc,NYSE,Stock,1999-11-18,,Active
AA,,NYSE,Stock,2016-10-18,,Active
''';

      final List<List<String>> parsedData = fileStockDataSource.getParseCsv(csv);
      expect(parsedData.length, 2); // name이 null인 행은 제거되어야 하므로 2개만 남아야 함
    });
  });

}



/*
void main() async {

  final String filePath = 'C:/dev/DartProjects/modu-3-dart-study/test/2025-03-31/stock_project/';
  final fileStockDataSource = FileStockDataSource(filePath + 'listing_status.csv');
  final stocks = await fileStockDataSource.getStocks();

  for (Stock stock in stocks) {
    print("""
    심볼: ${stock.symbol}
    이름: ${stock.name ?? '없음'}
    거래소: ${stock.exchange}
    자산 유형: ${stock.assetType}
    IPO 날짜: ${stock.ipoDate}
    상장 폐지 날짜: ${stock.delistingDate ?? '없음'}
    상태: ${stock.status}
    """);
  }
}

*/