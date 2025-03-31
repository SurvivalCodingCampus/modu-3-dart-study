import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/stock_project/data_source/stock_data_source.dart';
import 'package:modu_3_dart_study/2025-03-31/stock_project/model/stock.dart';

class FileStockDataSource implements StockDataSource {

  final String filePath;
  FileStockDataSource(this.filePath);

  @override
  Future<List<Stock>> getStocks() async {
    final File file = File(filePath);
    final String contents = await file.readAsString();

    //CVS 데이터 변환
    final List<List<String>> csvData = _parseCsv(contents);
    //CSV 데이터를 Stock 객체 리스트를 변환
    return _convertCsvToStockList(csvData);
  }

  //CSV 데이터 변환
  List<List<String>> _parseCsv(String csv) {
    final rows = LineSplitter.split(csv).toList();   //csv.split('/n'); 크로스 플랫폼에서 안정적이지 않음
    return rows
        .map((row) => row.split(','))    // 줄단위 나누고,
        .where((cols) => cols[1].trim().isNotEmpty && cols[1].trim() != 'null') // name이 비어있지 않고, 'null'이 아닌 경우만 남김. 처리속도 높이기 위해 미리 제거
        .toList();
  }

  List<List<String>> getParseCsv(String csv) {
    return _parseCsv(csv);
  }

  // CSV 데이터를 Stock 객체 리스트로 변환하는 함수
  List<Stock> _convertCsvToStockList(List<List<String>> csvData) {
    final List<Stock> stocks = <Stock>[];
    for (int i = 1; i < csvData.length; i++) {   //csv 헤더 제거
      final List<String> row = csvData[i];
      final Stock stock = Stock.fromCsv(row);
      stocks.add(stock);
    }
    return stocks;
  }

}