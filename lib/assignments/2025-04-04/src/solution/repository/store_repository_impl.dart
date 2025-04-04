import '../data_source/store_data_source.dart';
import '../data_source/store_data_source_impl.dart';
import '../mapper/store_mapper.dart';
import '../model/store.dart';
import 'store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl({required StoreDataSource storeDataSource})
    : _storeDataSource = storeDataSource;

  @override
  Future<Store> getStore(String code) async {
    try {
      final stores = await getStores();
      return stores.firstWhere((e) => e.code == code);
    } catch (e) {
      throw Exception('해당 코드에 맞는 데이터가 없습니다');
    }
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

void main() async {
  final repository = StoreRepositoryImpl(
    storeDataSource: StoreDataSourceImpl(),
  );

  final result = await repository.getStores();
  print(result.where((e) => e.remainStat == null));
  //print(result);
}
