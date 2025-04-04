import '../../dto/25-04-04/store_dto.dart';

abstract interface class StoreDataSource {
  Future<List<StoreDto>> getStores();
}
