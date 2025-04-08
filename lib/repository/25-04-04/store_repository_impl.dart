import 'package:modu_3_dart_study/mapper/25-04-04/to_store_model.dart';
import 'package:modu_3_dart_study/model/25-04-04/store.dart';
import 'package:modu_3_dart_study/repository/25-04-04/store_repository.dart';
import '../../data_source/25-04-04/store_data_source.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;
  StoreRepositoryImpl(this._dataSource);
  @override
  Future<List<Store>> getStoreList() async {
    final storeDtos = await _dataSource.getStores();
    return storeDtos
        .where(
          (e) =>
              e.remainStat != null && e.stockAt != null && e.createdAt != null,
        )
        .map((e) => e.toStoreModel())
        .toList();
  }
}
