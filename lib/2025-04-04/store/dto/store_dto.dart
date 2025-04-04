import 'package:json_annotation/json_annotation.dart';
import 'package:modu_3_dart_study/2025-04-04/store/mapper/store_mapper.dart';
import 'package:modu_3_dart_study/2025-04-04/store/model/store.dart';
import 'package:modu_3_dart_study/dto_utils/json_convert.dart';

part 'store_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class StoreDto implements JsonConvert<StoreDto, Store> {
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

  const StoreDto({
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

  const StoreDto.empty()
    : addr = null,
      code = null,
      createdAt = null,
      lat = null,
      lng = null,
      name = null,
      remainStat = null,
      stockAt = null,
      type = null;

  factory StoreDto.fromJson(Map<String, dynamic> json) =>
      _$StoreDtoFromJson(json);

  @override
  StoreDto fromJson(json) {
    return StoreDto.fromJson(json);
  }

  @override
  Store toEntity() {
    return toStore();
  }

  @override
  Map<String, dynamic> toJson() => _$StoreDtoToJson(this);
}
