import '../model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();

  Future<Store> getStore(String code);
}
