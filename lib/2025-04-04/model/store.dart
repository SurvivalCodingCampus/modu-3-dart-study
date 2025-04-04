import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    required String name,
    required String addr,
    required double lat,
    required double lng,
    required String remainStat,
  }) = _Store;
}
