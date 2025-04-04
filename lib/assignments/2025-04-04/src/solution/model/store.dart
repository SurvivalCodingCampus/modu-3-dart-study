import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required String addr,
    required String code,
    required double lat,
    required double lng,
    required String name,
    required String remainStat,
    required String stockAt,
  }) = _Store;
}
