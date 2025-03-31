import 'package:test/test.dart';
import '../../../../assignments/2025-03-31/data_source/stock/stock_list_data_source.dart';
import '../../../../assignments/2025-03-31/data_source/stock/stock_list_data_source_impl.dart';

void main() {
  test('stock list data (csv) 역직렬화 테스트', () async {
    final StockListDataSource dataSource = StockListDataSourceImpl();
    final stockList = await dataSource.fetchStockList();
    final nameNotNullData = stockList.where((e) => e.name.isNotEmpty).toList();
    final nameNullData = stockList.where((e) => e.name.isEmpty).toList();
    print(nameNullData.length);
    print(nameNotNullData.length);
    expect(stockList.length, equals(11831));
    expect(nameNullData.length + nameNotNullData.length, equals(11831));
  });
}
