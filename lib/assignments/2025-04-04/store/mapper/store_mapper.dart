import 'package:modu_3_dart_study/assignments/2025-04-04/store/dto/store_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/store/model/store.dart';

extension StoreMapper on StoreDto {
  List<int> makeDateTime(String string) {
    List<int> result = [];
    if (string != '') {
      List<String> temp = string.split(' ');
      List<String> temp1 = temp.first.split('/');
      List<String> temp2 = temp.last.split(':');
      final year = temp1[0];
      final month = temp1[1];
      final day = temp1[2];
      final hour = temp2[0];
      final minute = temp2[1];
      final second = temp2[2];
      result = [
        int.parse(year),
        int.parse(month),
        int.parse(day),
        int.parse(hour),
        int.parse(minute),
        int.parse(second),
      ];
    }

    return result;
  }

  Store toStore() {
    DateTime storeCreatedAt = DateTime(1999, 1, 1);
    if (createdAt != '') {
      final createdAtList = makeDateTime(createdAt);
      storeCreatedAt = DateTime(
        createdAtList[0],
        createdAtList[1],
        createdAtList[2],
        createdAtList[3],
        createdAtList[4],
        createdAtList[5],
      );
    }

    DateTime storeStockAt = DateTime(1999, 1, 1);
    if (stockAt != '') {
      final stockAtList = makeDateTime(stockAt);
      storeStockAt = DateTime(
        stockAtList[0],
        stockAtList[1],
        stockAtList[2],
        stockAtList[3],
        stockAtList[4],
        stockAtList[5],
      );
    }

    return Store(
      address: addr,
      code: code,
      createdAt: storeCreatedAt,
      lat: lat,
      lng: lng,
      name: name,
      remainStat: remainStat,
      stockAt: storeStockAt,
      type: type,
    );
  }
}
