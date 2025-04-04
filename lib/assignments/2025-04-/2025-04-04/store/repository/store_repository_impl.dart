import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/common/const/error_data.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/model/store.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;

  StoreRepositoryImpl(this._dataSource);

  @override
  Future<List<Store>> fetchStores() async {
    final resp = await _dataSource.fetchStores();
    final stores = resp.map((e) => e.toStore()).toList();
    return stores;
  }

  @override
  Future<List<Store>> filteredStores() async {
    final stores = await fetchStores();
    final stringNullData = ErrorData.stringNullData;
    final filteredStores =
        stores
            .where(
              (e) =>
                  (e.remainStat != stringNullData) &&
                  (e.stockAt != stringNullData) &&
                  (e.createdAt != stringNullData),
            )
            .toList();
    return filteredStores;
  }
}
