import 'package:freezed_annotation/freezed_annotation.dart';

part 'mask_info_dto.freezed.dart';
part 'mask_info_dto.g.dart';

@freezed
abstract class MaskInfoDto with _$MaskInfoDto {
  const factory MaskInfoDto({int? count, List<MaskInfoDtoStores?>? stores}) =
      _MaskInfoDto;

  factory MaskInfoDto.fromJson(Map<String, dynamic> json) =>
      _$MaskInfoDtoFromJson(json);
}

@freezed
abstract class MaskInfoDtoStores with _$MaskInfoDtoStores {
  const factory MaskInfoDtoStores({
    String? addr,
    String? code,
    @JsonKey(name: 'created_at') String? createdAt,
    double? lat,
    double? lng,
    String? name,
    @JsonKey(name: 'remain_stat') String? remainStat,
    @JsonKey(name: 'stock_at') String? stockAt,
    String? type,
  }) = _MaskInfoDtoStores;

  factory MaskInfoDtoStores.fromJson(Map<String, dynamic> json) =>
      _$MaskInfoDtoStoresFromJson(json);
}
