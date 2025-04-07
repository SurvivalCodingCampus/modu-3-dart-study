import 'package:modu_3_dart_study/2025-04-03/solution1/data_sourece/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/model/store.dart';
import 'package:modu_3_dart_study/2025-04-03/solution1/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource storeDataSource;

  StoreRepositoryImpl(this.storeDataSource);

  @override
  Future<List<Store>> getAllStores() async {
    final storeRawData = await storeDataSource.readAllStores();

    final List<Store> stores = storeRawData
      .map((e) => StoreDto.fromJson(e).toStore())
      .where((store) => store != null)
      .cast<Store>()
      .toList();
    return stores;
  }
}
