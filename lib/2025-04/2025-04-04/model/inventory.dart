import 'package:freezed_annotation/freezed_annotation.dart';

import 'remain_status.dart';

part 'inventory.freezed.dart';

@freezed
abstract class Inventory with _$Inventory {
  const factory Inventory({
    required String addr,
    required String code,
    required DateTime createdAt,
    required double lat,
    required double lng,
    required String name,
    required DateTime stockAt,
    required RemainStatus remainStatus,
    required String type,
  }) = _Inventory;
}
