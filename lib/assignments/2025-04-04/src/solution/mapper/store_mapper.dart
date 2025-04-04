import '../dto/store_dto.dart';
import '../model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      addr: addr,
      code: code,
      lat: lat?.toDouble(),
      lng: lng?.toDouble(),
      name: name,
      remainStat: remainStat,
      stockAt: stockAt,
    );
  }
}
