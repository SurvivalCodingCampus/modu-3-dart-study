import 'package:modu_3_dart_study/2025-04-04/dto/store_dto.dart';

import '../model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      name: name ?? '',
      code: code ?? '',
      createAt: createdAt ?? '',
      stockAt: stockAt ?? '',
      remainStat: remainStat ?? '',
    );
  }
}
