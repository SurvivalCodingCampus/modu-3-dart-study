import 'package:json_annotation/json_annotation.dart';

part 'mask_store_dto.g.dart';

@JsonSerializable()
class MaskStoreDto {
  final String? code;
  final String? name;
  final String? addr;
  final String? type;
  final num? lat;
  final num? lng;
  @JsonKey(name: 'stock_at')
  final String? stockAt;
  @JsonKey(name: 'remain_stat')
  final String? remainStat;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  MaskStoreDto({
    this.code,
    this.name,
    this.addr,
    this.type,
    this.lat,
    this.lng,
    this.stockAt,
    this.remainStat,
    this.createdAt,
  });

  factory MaskStoreDto.fromJson(Map<String, dynamic> json) =>
      _$MaskStoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MaskStoreDtoToJson(this);
}
