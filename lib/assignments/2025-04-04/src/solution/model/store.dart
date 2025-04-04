import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';

@freezed
abstract class Store with _$Store {
  const factory Store({
    String? addr,
    String? code,
    double? lat,
    double? lng,
    String? name,
    String? remainStat,
    String? stockAt,
  }) = _Store;
}
