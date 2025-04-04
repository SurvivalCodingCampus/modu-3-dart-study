import '../dto/store_dto.dart';
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
