import 'package:modu_3_dart_study/2025-04-04/model/store.dart';

import '../dto/mask_store_dto.dart';

extension StoreMapper on MaskStoreDto {
  Store toStore() {
    return Store(
      name: name ?? '',
      addr: addr ?? '',
      lat: lat?.toDouble() ?? 0.0,
      lng: lng?.toDouble() ?? 0.0,
      remainStat: remainStat ?? '',
    );
  }
}
