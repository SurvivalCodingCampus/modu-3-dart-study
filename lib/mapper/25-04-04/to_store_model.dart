import '../../dto/25-04-04/store_dto.dart';
import '../../model/25-04-04/store.dart';

extension ToStoreModel on StoreDto {
  Store toStoreModel() {
    return Store(
      name: name ?? '이름 없음',
      address: addr ?? '주소 없음',
      remainStat: remainStat ?? '재고 없음',
      stockAt: DateTime.parse(stockAt ?? DateTime.now().toString()),
    );
  }
}
