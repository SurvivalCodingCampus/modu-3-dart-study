import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/2025-04-04/exam1/model/stores.dart';

part 'stores_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class StoresDto {
  final String? addr;
  final String? code;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final num? lat;
  final num? lng;
  final String? name;
  @JsonKey(name: 'remain_state')
  final String? remainState;
  @JsonKey(name: 'stock_at')
  final DateTime? stockAt;
  final String? type;

  const StoresDto({
    this.addr,
    this.code,
    this.createdAt,
    this.lat,
    this.lng,
    this.name,
    this.remainState,
    this.stockAt,
    this.type,
  });

  factory StoresDto.fromJson(Map<String,dynamic> json) => _$StoresDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoresDtoToJson(this);
}
