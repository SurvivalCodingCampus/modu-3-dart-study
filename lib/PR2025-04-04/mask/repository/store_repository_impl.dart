import 'package:modu_3_dart_study/PR2025-04-04/mask/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-04/mask/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/PR2025-04-04/mask/model/store.dart';
import 'package:modu_3_dart_study/PR2025-04-04/mask/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  const StoreRepositoryImpl({required StoreDataSource storeDataSource})
    : _storeDataSource = storeDataSource;

  @override
  Future<List<Store>> getStoreInfoList() async {
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
