import 'package:modu_3_dart_study/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/data_source/store_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-04/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/store_repository.dart';

import '../dto/store_dto.dart';
import '../model/store.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  const StoreRepositoryImpl({required StoreDataSource storeDataSource})
    : _storeDataSource = storeDataSource;

  @override
  Future<List<Store>> getStores() async {
    try {
      final List<StoreDto> storeDtos = await _storeDataSource.getStores();
      return storeDtos
          .where(
            (e) =>
                e.createdAt != null &&
                e.stockAt != null &&
                e.remainStat != null,
          )
          .map((e) => e.toStore())
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

void main() async {
  const String url =
      'https://gist.githubusercontent.com/junsuk5/2b34223fb2368d2bf44c85082745649a/raw/00cb276cb4f4f9573d868e88382f6f7f6759df31/mask_store.json';
  final StoreDataSource storeDataSource = StoreDataSourceImpl(url: url);
  final StoreRepository storeRepository = StoreRepositoryImpl(
    storeDataSource: storeDataSource,
  );

  final List<Store> stores = await storeRepository.getStores();
  print(stores);
}
