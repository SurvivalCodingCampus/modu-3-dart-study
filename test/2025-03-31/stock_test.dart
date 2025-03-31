import 'package:test/test.dart';

import '../../assignments/2025-03-31/data_source/impl/stock_data_source_impl.dart';
import '../../assignments/2025-03-31/data_source/stock_data_source.dart';
import '../../assignments/2025-03-31/enums/asset_type.dart';
import '../../assignments/2025-03-31/model/stock.dart';

void main() {
  final StockDataSource stockDataSource = StockDataSourceImpl();
  const String fileName = 'listing_status.csv';
  const String wrongFileName = 'listin2g_status.csv';
  const int assetTypeStockColumnNum = 7_597;
  const int assetTypeETFColumnNum = 4_193;

  group('주식 : ', () {
    test('listing_status.csv 파일 받아오기', () async {
      // given
      final List<Stock> stocks = await stockDataSource.getStocksFromFile(
        fileName,
      );

      // then
      expect(stocks, isA<List<Stock>>());
      expect(stocks.where((element) => element.name == '').toList(), isEmpty);
      expect(
        stocks
            .where((element) => element.assetType == AssetType.stock)
            .toList()
            .length,
        equals(assetTypeStockColumnNum),
      );
      expect(
        stocks
            .where((element) => element.assetType == AssetType.etf)
            .toList()
            .length,
        equals(assetTypeETFColumnNum),
      );
    });
    test('listing_status.csv 파일 받아오기 실패', () async {
      expect(
        () async => await stockDataSource.getStocksFromFile(wrongFileName),
        throwsA(isArgumentError),
      );
    });
  });
}
