import '../../model/stock/stock_list_model.dart';
import '../../model/stock/stock_model.dart';
import '../base/base_data_source.dart';
import 'stock_data_source.dart';

class StockDataSourceImpl extends BaseDataSource
    implements StockDataSource {
  @override
  String get basePath => 'assignments/2025-03-31/data/';

  StockDataSourceImpl();

  @override
  Future<List<Stock>> fetchStockList() async {
    final csvData = fetchCsv('listing_status.csv');
    final stockList = StockList.fromCsv(csvData);
    return stockList.list;
  }
}
