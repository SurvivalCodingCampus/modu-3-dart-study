import '../model/mask_store.dart';

abstract interface class MaskStoreRepository {
  Future<List<MaskStore>> getStoresModel();
  Future<MaskStore> getStoreModel(int code);
}
