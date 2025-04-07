import 'package:intl/intl.dart';

import '../dto/store_dto.dart';
import '../model/store.dart';
import '../model/store_remain_stat.dart';

extension StoreMapper on StoreDto {
  Store toStore() {
    return Store(
      addr: addr ?? '',
      code: int.tryParse(code ?? '') ?? -1,
      createdAt: _parseCustomDateTime(createdAt),
      lat: lat?.toDouble() ?? -1,
      lng: lng?.toDouble() ?? -1,
      name: name ?? '',
      remainStat: _parseCustomRemainStat(remainStat),
      stockAt: _parseCustomDateTime(stockAt),
      type: type ?? '',
    );
  }
}

DateTime? _parseCustomDateTime(String? raw) {
  if (raw == null || raw.isEmpty) return null;
  try {
    return DateFormat('yyyy/MM/dd HH:mm:ss').parse(raw);
  } catch (e) {
    return null;
  }
}

StoreRemainStat? _parseCustomRemainStat(String? stat) {
  switch (stat) {
    case 'plenty':
      return StoreRemainStat.plenty;
    case 'some':
      return StoreRemainStat.some;
    case 'few':
      return StoreRemainStat.few;
    case 'empty':
      return StoreRemainStat.empty;
    case 'break':
      return StoreRemainStat.break_;
    default:
      return null;
  }
}
