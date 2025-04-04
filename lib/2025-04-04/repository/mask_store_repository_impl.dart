import 'package:modu_3_dart_study/2025-04-04/model/store.dart';

import '../data_source/mask_store_data_source.dart';
import '../dto/mask_store_dto.dart';
import '../mapper/store_mapper.dart';
import 'mask_store_repository.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreDataSource _dataSource;

  MaskStoreRepositoryImpl({required MaskStoreDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Store>> getValidStores() async {
    List<MaskStoreDto> maskStoreDtos = await _dataSource.fetchMaskStores();

    return maskStoreDtos
        .where(
          (dto) =>
              dto.remainStat != null &&
              dto.stockAt != null &&
              dto.createdAt != null,
        )
        .map((dto) => dto.toStore())
        .toList();
  }
}
