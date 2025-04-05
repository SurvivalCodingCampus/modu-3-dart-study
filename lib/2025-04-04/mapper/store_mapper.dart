import 'package:modu_3_dart_study/2025-04-04/dto/store_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/extension/date_time_extension.dart';
import 'package:modu_3_dart_study/2025-04-04/model/enum/remain_stat.dart';
import 'package:modu_3_dart_study/2025-04-04/model/store.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      addr: addr,
      code: code,
      createdAt: createdAt?.toDateTime(format: 'yyyy/MM/dd HH:mm:ss') ?? DateTime(1970, 1, 1),
      lat: lat.toDouble(),
      lng: lng.toDouble(),
      name: name,
      remainStat: remainStat.toRemainStat(),
      stockAt: stockAt.toDateTime(format: 'yyyy/MM/dd HH:mm:ss') ?? DateTime(1970, 1, 1),
      type: type,
    );
  }
}
