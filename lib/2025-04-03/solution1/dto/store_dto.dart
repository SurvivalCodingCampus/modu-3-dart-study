import 'package:json_annotation/json_annotation.dart';

part 'store_dto.g.dart';

@JsonSerializable()
class StoreDto {
  final String? addr;
  final String? code;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  final num? lat;
  final num? lng;
  final String? name;

  @JsonKey(name: 'remain_stat')
  final String? remainStat;

  @JsonKey(name: 'stock_at')
  final String? stockAt;

  final String? type;

  StoreDto({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainStat,
    this.stockAt,
    this.type,
  });

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDtoToJson(this);
}
