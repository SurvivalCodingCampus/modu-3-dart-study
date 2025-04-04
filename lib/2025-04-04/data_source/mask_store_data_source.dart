import 'package:modu_3_dart_study/2025-04-04/dto/mask_store_dto.dart';

abstract interface class MaskStoreDataSource {
  Future<List<MaskStoreDto>> fetchMaskStores();
}
