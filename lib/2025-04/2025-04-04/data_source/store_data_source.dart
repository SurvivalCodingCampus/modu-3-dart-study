import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/store_dto.dart';

abstract interface class StoreDataSource {
  Future<List<StoreDto>> fetchStore();
}
