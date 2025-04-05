import '../dto/store_dto.dart';
import '../model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      addres: addr ?? '위치 알 수 없음',
      openDay: created_at ?? '오픈 일자 알 수 없음',
      lat: lat?.toDouble() ?? 0.0,
      lng: lng?.toDouble() ?? 0.0,
      storeName: name ?? '이름 알 수 없음',
      remainState: remain_stat ?? '상태 알 수 없음',
      stockAt: stock_at ?? 'stockAt알 수 없음',
    );
  }
}
