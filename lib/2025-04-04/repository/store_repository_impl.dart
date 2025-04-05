import 'package:modu_3_dart_study/2025-04-04/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/mapper/store_list_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/model/store_list.dart';

import 'store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl({required StoreDataSource storeDataSource})
    : _storeDataSource = storeDataSource;

  @override
  Future<StoreList> getStoreList() async {
    final storeDto = await _storeDataSource.fetchStoreList();
    return storeDto.toStoreList();
  }
}
