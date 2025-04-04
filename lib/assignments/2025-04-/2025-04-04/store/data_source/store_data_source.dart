import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/store/dto/store_dto.dart';

abstract interface class StoreDataSource {
  Future<List<StoreDto>> fetchStores();
}
