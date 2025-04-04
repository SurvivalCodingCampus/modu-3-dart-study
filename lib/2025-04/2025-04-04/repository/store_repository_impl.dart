import 'package:modu_3_dart_study/2025-04/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/store_dto.dart'
    show StoreDto;
import 'package:modu_3_dart_study/2025-04/2025-04-04/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/store.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _dataSource;

  const StoreRepositoryImpl(this._dataSource);

  @override
  Future<List<Store>> findAll() async {
    final List<StoreDto> stores = await _dataSource.fetch();
    return stores.map((e) => e.toModel()).toList();
  }

  @override
  Future<Store?> findOne(bool Function(Store) predicate) async {
    final List<Store> stores = await findAll();
    return stores.where(predicate).firstOrNull;
  }
}
