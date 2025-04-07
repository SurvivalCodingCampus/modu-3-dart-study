import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/dto/stores_result_dto.dart';

abstract interface class StoreDataSource {
  Future<StoresResultDto> getStoresResultDto();
}
