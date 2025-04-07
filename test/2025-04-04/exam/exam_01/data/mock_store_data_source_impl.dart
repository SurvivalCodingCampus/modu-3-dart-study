import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/data_source/store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/dto/stores_result_dto.dart';

import 'stores_json.dart';

class MockStoreDataSourceImpl implements StoreDataSource {
  @override
  Future<StoresResultDto> getStoresResultDto() async {
    return StoresResultDto.fromJson(storeJson);
  }
}

