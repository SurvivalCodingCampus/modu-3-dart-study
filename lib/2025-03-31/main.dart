import 'data_source/stock_data_source_impl.dart';

void main() async {
  final stockDataSource = StockDataSourceImpl();
  final listings = await stockDataSource.getStockListings();

  for (var listing in listings) {
    print(listing);
  }
}
