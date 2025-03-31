import '../../model/stock/stock_list_model.dart';
import '../../model/stock/stock_model.dart';
import '../base/base_data_source.dart';
import 'stock_list_data_source.dart';

class StockListDataSourceImpl extends BaseDataSource
    implements StockListDataSource {
  @override
  String get path => 'assignments/2025-03-31/data/listing_status.csv';

  StockListDataSourceImpl();

  @override
  Future<List<Stock>> fetchStockList() async {
    final csvData = fetchCsv();
    final stockList = StockList.fromCsv(csvData);
    return stockList.list;
  }
}
