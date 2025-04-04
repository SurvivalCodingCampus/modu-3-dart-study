import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_dto.g.dart';

@JsonSerializable()
class StoreDto {
  final String? addr;
  final String? code;
  @JsonKey(name: "created_at")
  final String? createdAt;
  final num? lat;
  final num? lng;
  final String? name;
  @JsonKey(name: "remain_stat")
  final String? remainStat;
  @JsonKey(name: "stock_at")
  final String? stockAt;
  final String? type;

  StoreDto({
    required this.addr,
    required this.code,
    required this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    required this.remainStat,
    required this.stockAt,
    required this.type,
  });

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDtoToJson(this);
}
