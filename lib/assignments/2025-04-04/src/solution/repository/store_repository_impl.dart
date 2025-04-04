import '../data_source/store_data_source.dart';
import '../mapper/store_mapper.dart';
import '../model/store.dart';
import 'store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl({required StoreDataSource storeDataSource})
    : _storeDataSource = storeDataSource;

  @override
  Future<Store> getStore(String code) async {
    final store = await _storeDataSource.getStore(code);
    return store.toStore();
  }

  @override
  Future<List<Store>> getStores() async {
    final storeDtos = await _storeDataSource.getStores();

    return storeDtos
        .where(
          (e) =>
              e.createdAt != null && e.remainStat != null && e.stockAt != null,
        )
        .map((e) => e.toStore())
        .toList();
  }
}
