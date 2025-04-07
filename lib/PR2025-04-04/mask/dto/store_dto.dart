import 'package:json_annotation/json_annotation.dart';

part 'store_dto.g.dart';

//jsonserializable은 lib 파일에서만 사용가능
@JsonSerializable(explicitToJson: true)
class StoreDto {
  final String? addr;
  final String? code;
  final String? created_at;
  final num? lat;
  final num? lng;
  final String? name;
  final String? remain_stat;
  final String? stock_at;
  final String? type;

  factory StoreDto.StoreDtofromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreDtoToJson(this);

  const StoreDto({
    this.addr,
    this.code,
    this.created_at,
    this.lat,
    this.lng,
    this.name,
    this.remain_stat,
    this.stock_at,
    this.type,
  });
}
