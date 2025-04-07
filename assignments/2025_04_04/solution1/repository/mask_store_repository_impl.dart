import '../data_source/mask_store_data_source.dart';
import '../mapper/mask_store_mapper.dart';
import '../model/mask_store.dart';
import 'mask_store_repository.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreDataSource _maskStoreDataSource;

  MaskStoreRepositoryImpl({required MaskStoreDataSource maskStoreDataSource})
    : _maskStoreDataSource = maskStoreDataSource;

  @override
  Future<List<MaskStore>> getStoresModel() async {
    final result = await _maskStoreDataSource.getStoresDto();
    final List<MaskStore> storesList = [];

    for (var store in result) {
      final replaceCreate = store.createdAt?.replaceAll('/', '-');
      final replaceStock = store.stockAt?.replaceAll('/', '-');
      store.createdAt = replaceCreate;
      store.stockAt = replaceStock;
      storesList.add(store.toMaskStore());
    }
    print(storesList);

    return storesList;
  }

  @override
  Future<MaskStore> getStoreModel(int code) async {
    final result = await getStoresModel();
    final store = result.singleWhere((e) => e.code == code);

    return store;
  }
}
