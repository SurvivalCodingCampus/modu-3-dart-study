import 'dart:convert';
import 'dart:io';

import 'stock_data_source.dart';
import 'stock_iisting.dart';

class StockDataSourceImpl implements StockDataSource {
  final String cvsFilePath =
      '${Directory.current.path}/assignments/2025-03-31/stock_solution/listing_status.csv';

  @override
  Future<List<StockListing>> getStockListings() async {
    try {
      final File csvFile = File(cvsFilePath);
      String csvFromFile = await csvFile.readAsString();
      List<String> csvItems =
          csvFromFile.split('\n').map((e) => e.trim()).toList();
      // print(csvItems);
      csvItems.removeWhere((e) => e.isEmpty); // 비어있는 배열제거
      // print(csvItems);
      csvItems.removeAt(0);

      List<StockListing> stockListings =
          csvItems
              .map((e) {
                List<String> csvRow = e.split(',');
                return StockListing.fromCsv(csvRow);
              })
              .where((item) => item.name.isNotEmpty) // 이름이 비워있지 않음..
              .toList();
      print(stockListings);
      return stockListings;
    } on FormatException {
      throw FormatException('JSON 파싱 중 오류가 발생했습니다');
    } catch (e) {
      print(e);
      throw Exception('Error fetching Todo: $e');
    }
  }
}

void main() async {
  final List<StockListing> stockListing =
      await StockDataSourceImpl().getStockListings();
}
