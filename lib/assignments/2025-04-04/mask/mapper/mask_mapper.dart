import 'package:modu_3_dart_study/assignments/2025-04-04/mask/dto/mask_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/mask/model/mask.dart';

extension MaskMapper on Store {
  Mask toModel() {
    List<int> stockAt = '1999-01-01'.split('-').map((e) => int.parse(e),).toList();
    if (stock_at != '') {
      stockAt = stock_at!.split(' ').first.split('/').map((e) => int.parse(e),).toList();
    }

    List<int> createdAt = '1999-01-01'.split('-').map((e) => int.parse(e),).toList();
    if (created_at != '') {
      createdAt = created_at!.split(' ').first.split('/').map((e) => int.parse(e),).toList();
    }

    return Mask(
      name: name,
      address: addr ?? '',
      remainStat: remain_stat ?? '',
      stockAt: DateTime(stockAt[0],stockAt[1],stockAt[2]),
      createdAt: DateTime(createdAt[0],createdAt[1],createdAt[2]),
      lat: lat ?? 0,
      lng: lng ?? 0,
      code: int.tryParse(code ?? '0') ?? 0,
    );
  }
}
