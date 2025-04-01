import 'stock/data_source/stock_data_source_impl.dart';

void main() async {
  final data = await StockDataSourceImpl().getStockListings();

  print(data);
}
