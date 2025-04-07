import 'package:modu_3_dart_study/2025-04-04/dto/mask_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/model/mask.dart';

extension MaskMapper on MaskDto {
  Mask toDomain() {
    return Mask(
      address: addr ?? '',
      createdAt: createdAt ?? DateTime.now(),
      latitude: (lat ?? 0).toDouble(),
      longitude: (lng ?? 0).toDouble(),
      name: name ?? '',
      remainStatus: remainStat ?? 'unknown',
      stockAt: stockAt ?? DateTime.now(),
    );
  }
}
