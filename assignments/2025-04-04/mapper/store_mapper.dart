import '../dto/store_dto.dart';
import '../model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      address: addr ?? '위치 정보 없음',
      openDay: created_at ?? '알 수 없음',
      lat: lat?.toDouble() ?? 0.0,
      lng: lng?.toDouble() ?? 0.0,
      storeName: name ?? '알 수 없음',
      remainState: remain_stat ?? '알 수 없음',
      stockAt: stock_at ?? '알 수 없음',
    );
  }
}
