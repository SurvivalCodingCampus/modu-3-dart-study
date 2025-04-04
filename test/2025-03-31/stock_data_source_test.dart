import 'package:collection/collection.dart';
import 'package:test/test.dart';

import 'package:modu_3_dart_study/2025-03-31/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/stock_listing.dart';

void main() {
  final StockDataSource stockDataSource = StockDataSourceImpl();

  group('StockListing 테스트', () {
    test('StockListing 직렬화, 역직렬화가 정상적으로 이뤄져야 한다.', () async {
      final stockList = await stockDataSource.getStockListings();

      // toCSV
      final List<String> csv = [StockListing.indexes.join(',')];
      csv.addAll(stockList.map((e) => e.toCsvRow()).toList());

      // toStockListing
      final List<StockListing> deserializationStockList = [];
      for (int i = 1; i < csv.length; i++) {
        final stockListing = StockListing.fromCsv(csv[i]);
        deserializationStockList.add(stockListing);
      }

      expect(
        ListEquality().equals(stockList, deserializationStockList),
        isTrue,
      );
    });
  });
}
