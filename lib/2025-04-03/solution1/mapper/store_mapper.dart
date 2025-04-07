import 'package:modu_3_dart_study/2025-04-03/solution1/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/model/store.dart';

extension StoreMapper on StoreDto {
  Store? toStore() {
    if ((remainStat?.isEmpty ?? true) || (stockAt?.isEmpty ?? true) || (createdAt?.isEmpty ?? true)) {
      return null;
    }

    try {
      return Store(
        code: code ?? '',
        name: name ?? '이름 없음',
        address: addr ?? '주소 없음',
        lat: lat?.toDouble() ?? 0.0,
        lng: lng?.toDouble() ?? 0.0,
        remainStat: remainStat!,
        stockAt: DateTime.parse(stockAt!.replaceAll('/', '-')),
        createdAt: DateTime.parse(createdAt!.replaceAll('/', '-')),
      );
    } catch (e) {
      return null;
    }
  }
}
