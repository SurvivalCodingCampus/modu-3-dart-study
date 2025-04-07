import '../dto/store_dto.dart';

abstract interface class StoreDataSource {
  Future<List<StoreDto>> getStores();
}