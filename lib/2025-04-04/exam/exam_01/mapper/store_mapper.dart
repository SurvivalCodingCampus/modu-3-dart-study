import 'package:modu_3_dart_study/2025-04-04/exam/exam_01/dto/stores_result_dto.dart';

import '../model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      address: addr ?? '',
      name: name ?? '',
      remainStatus: remainStat ?? '',
      latitude: lat?.toDouble() ?? 0.0,
      longitude: lng?.toDouble() ?? 0.0,
    );
  }
}
