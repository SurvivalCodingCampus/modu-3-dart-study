import 'package:modu_3_dart_study/2025-04/2025-04-04/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04/2025-04-04/model/store.dart';

extension StoreMapper on StoreDto {
  Store toModel() {
    return Store(
      addr: addr!,
      code: code!,
      createdAt: createdAt!,
      lat: lat!,
      lng: lng!,
      name: name!,
      stockAt: stockAt!,
      remainStatus: remainStatus!,
      type: type!,
    );
  }
}
