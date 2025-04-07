import '../dto/mask_store_dto.dart';
import '../model/mask_store.dart';

extension MaskStoreMapper on MaskStoreDto {
  MaskStore toMaskStore() {
    return MaskStore(
      address: addr ?? '주소 모름',
      name: name ?? '이름 모름',
      remainStat: remainStat ?? '재고 모름',
      code: int.parse(code ?? '-1'),
      createdAt: _parseDateTime(createdAt),
      stockAt: _parseDateTime(stockAt),
    );
  }
}

DateTime? _parseDateTime(String? dateTime) {
  if (dateTime == null || dateTime.isEmpty) return null;
  return DateTime.tryParse(dateTime);
}
