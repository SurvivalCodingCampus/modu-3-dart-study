import 'package:modu_3_dart_study/PR2025-04-04/mask/dto/store_dto.dart';

abstract interface class StoreDataSource {
  Future<List<StoreDto>> getStoresData();
}
