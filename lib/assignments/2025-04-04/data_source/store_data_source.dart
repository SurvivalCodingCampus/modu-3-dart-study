import '../dto/store_dto.dart';
import '../model/store_remain_stat.dart';

abstract interface class StoreDataSource {
  Future<List<StoreDto>> getStoresMaskInfo();
  Future<StoreDto> getStoreMaskInfo({required int code});
  Future<int> postStoreInfo({
    required String addr,
    required String name,
    required double lat,
    required double lng,
  });
  Future<void> patchStoreMaskInfo({
    required int code,
    required StoreRemainStat remainStat,
    required String stockAt,
  });
  Future<void> deleteStore(int code);
}
