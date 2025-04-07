import '../dto/stores_dto.dart';

abstract interface class StoresDataSource {
  Future<List<StoresDto>> fetchStores();
}





