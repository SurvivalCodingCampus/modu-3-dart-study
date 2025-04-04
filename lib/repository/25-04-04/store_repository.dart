import '../../model/25-04-04/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStoreList();
}
