import '../data_source/store_data_source.dart';
import '../mapper/store_mapper.dart';
import '../model/store.dart';
import 'store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  const StoreRepositoryImpl({required StoreDataSource storeDataSource})
    : _storeDataSource = storeDataSource;

  @override
  Future<List<Store>> getStores() async {
    final storeList = await _storeDataSource.getStoresData();
    List<Store> store =
        storeList
            .where(
              (e) =>
                  e.remain_stat != null &&
                  e.stock_at != null &&
                  e.created_at != null,
            )
            .map((e) => e.toStore())
            .toList();
    return store;
  }
}
