import '../model/store.dart';
import '../model/store_remain_stat.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
  Future<Store> getStore(int code);
  Future<Store> createStore({
    required String addr,
    required String name,
    required double lat,
    required double lng,
  });
  Future<Store> updateMaskStat({
    required int code,
    required StoreRemainStat remainStat,
    required String stockAt,
  });
  Future<void> deleteStore(int code);
}
