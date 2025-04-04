import '../dto/store_dto.dart';
import '../model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      addr: addr ?? '',
      code: code ?? '',
      lat: lat?.toDouble() ?? 0.0,
      lng: lng?.toDouble() ?? 0.0,
      name: name ?? '',
      remainStat: remainStat ?? '',
      stockAt: stockAt ?? '',
    );
  }
}
