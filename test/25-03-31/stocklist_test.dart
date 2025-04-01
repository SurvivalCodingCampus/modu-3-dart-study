import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../assignments/2025-03-31/practice_0331_04.dart';

void main() {
  group('StockDataTest', () {
    test('csv 역직렬화', () async {
      final dataSource = StockData(
        '/Users/hemu/dev/DartProject/modu-3-dart-study/lib/data_source/listing_status.csv',
      );
      final stockListings = await dataSource.getStockListings();
      for (var stockListing in stockListings) {
        expect(stockListings[1].symbol, equals('AA'));
        expect(stockListings[2].symbol, equals('AAA'));
      }
    });
  });
}
