import 'package:json_annotation/json_annotation.dart';

part 'store_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class StoreDto {
  String addr;
  String code;
  @JsonKey(name: 'created_at')
  String? createdAt;
  num lat;
  num lng;
  String name;
  @JsonKey(name: 'remain_stat')
  String? remainStat;
  @JsonKey(name: 'stock_at')
  String? stockAt;
  String type;

  StoreDto({
    required this.addr,
    required this.code,
    this.createdAt,
    required this.lat,
    required this.lng,
    required this.name,
    this.remainStat,
    this.stockAt,
    required this.type,
  });

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDtoToJson(this);
}
