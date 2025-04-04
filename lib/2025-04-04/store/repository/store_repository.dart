import 'package:modu_3_dart_study/2025-04-04/store/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/store/dto/store_dto.dart';
import 'package:modu_3_dart_study/dto_utils/dto_repository.dart';

import '../model/store.dart';

abstract class StoreRepository
    extends DtoRepository<StoreDto, Store, StoreDataSource> {
  StoreRepository(super.dataSource, super.dto);
}
