import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_3_dart_study/2025-04-04/model/enum/remain_stat.dart';

// 코드 생성 파일 지정
part 'store.freezed.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required String addr,
    required String code,
    required DateTime createdAt,
    required double lat,
    required double lng,
    required String name,
    required RemainStat remainStat,
    required DateTime stockAt,
    required String type,
  }) = _Store;
}
