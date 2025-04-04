import 'package:modu_3_dart_study/2025-04-04/store/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/store/model/store.dart';
import 'package:modu_3_dart_study/dto_utils/slash_convert.dart';

extension ToStoreExtension on StoreDto {
  Store toStore() {
    return Store(
      addr: addr ?? '정보 없음',
      code: code ?? '정보 없음',
      name: name ?? '정보 없음',
      createdAt: DateTime.parse(createdAt?.changeSlash ?? '1970-01-01'),
      type: type ?? '정보 없음',
      stockAt: DateTime.parse(stockAt?.changeSlash ?? '1970-01-01'),
      remainStat: remainStat ?? '정보 없음',
    );
  }
}
