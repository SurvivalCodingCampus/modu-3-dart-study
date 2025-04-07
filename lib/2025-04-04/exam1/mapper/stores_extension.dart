import 'package:modu_3_dart_study/2025-04-04/exam1/dto/stores_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/exam1/model/stores.dart';

extension StoresExtension on StoresDto {
  Stores stores() {
    return Stores(addr: addr?.toString() ?? '주소 없음',
        code: code?.toString() ?? '코드 없음',
        createdAt: createdAt?.toLocal() ?? DateTime.now(),
        lat: lat?.toDouble() ?? -1,
        lng: lng?.toDouble() ?? -1,
        name: name?.toString() ?? '이름없음',
        remainState: remainState?.toString() ?? 'plenty 없음',
        stockAt: stockAt?.toLocal() ?? DateTime.now(),
        type: type?.toString() ?? '코드 없음');
  }
}
