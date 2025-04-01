import 'dart:io';
import 'package:csv/csv.dart';
import 'package:modu_3_dart_study/PR2025-03-31/data_source4/stock_data_source.dart';
import 'package:modu_3_dart_study/PR2025-03-31/model/stocklisting.dart';

class StockDataSourceImpl implements StockDataSource {
  @override
  Future<List<StockListing>> getStockListings() async {
    File file = File('lib/PR2025-03-31/model/listing_status.csv');
    final contents = await file.readAsString();
    List<List<dynamic>> csvData = CsvToListConverter().convert(contents);
    //  특정 열에 빈값이 있을때 행 자체 제거
    csvData.removeWhere(
      (row) => row.any((cell) => cell.toString().trim().isEmpty),
    );

    // 첫 줄은 헤더이므로 제거
    csvData.removeAt(0);

    return csvData.map((row) => StockListing.fromCsv(row)).toList();
  }
}
