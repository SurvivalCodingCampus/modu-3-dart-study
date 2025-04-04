import 'package:modu_3_dart_study/2025-04-04/store/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/store/model/store.dart';
import 'package:modu_3_dart_study/dto_utils/dto_data_source.dart';

abstract class StoreDataSource extends DtoDataSource<StoreDto, Store> {
  StoreDataSource(super.httpUrl, super.dto, {super.client});
}
