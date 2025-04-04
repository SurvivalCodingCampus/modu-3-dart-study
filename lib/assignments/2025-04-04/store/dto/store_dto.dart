import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_dto.freezed.dart';
part 'store_dto.g.dart';

@freezed
abstract class StoreDto with _$StoreDto {
  const factory StoreDto({
    @Default('') String addr,
    @Default('') String code,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @Default(-1) double lat,
    @Default(-1) double lng,
    @Default('') String name,
    @JsonKey(name: 'remain_stat') @Default('') String remainStat,
    @JsonKey(name: 'stock_at') @Default('') String stockAt,
    @Default('') String type,
  }) = _StoreDto;

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);
}
