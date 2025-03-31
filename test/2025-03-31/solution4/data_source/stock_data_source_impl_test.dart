import 'dart:convert';
import 'dart:io';

import 'package:modu_3_dart_study/2025-03-31/solution4/data_source/stock_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-03-31/solution4/model/stock_listing.dart';
import 'package:test/test.dart';

void main() async {
  test('4.주식 정보를 제공하는 데이터 소스', () async {
    String path = 'lib/2025-03-31/solution4/data_source/listing_status.csv';
    List stockList = [];
    new File(path)
        .openRead()
        .transform(utf8.decoder)
        .transform(new LineSplitter())
        .forEach((items) {
          stockList.add(items);
        });

    StockDataSourceImpl stockdatasourceimpl = StockDataSourceImpl();
    List<StockListing> stockListAll =
        await stockdatasourceimpl.getStockListings();

    for (int i = 0; i < stockList.length; i++) {
      expect(stockListAll[i].symbol, stockList[i][0]);
      expect(stockListAll[i].name, stockList[i][1]);
      expect(stockListAll[i].exchange, stockList[i][2]);
      expect(stockListAll[i].assetType, stockList[i][3]);

      expect(stockListAll[i].status, stockList[i][6]);
    }
  });
}
