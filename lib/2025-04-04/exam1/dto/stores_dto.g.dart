// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stores_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoresDto _$StoresDtoFromJson(Map<String, dynamic> json) => StoresDto(
  addr: json['addr'] as String?,
  code: json['code'] as String?,
  createdAt:
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
  lat: json['lat'] as num?,
  lng: json['lng'] as num?,
  name: json['name'] as String?,
  remainState: json['remain_state'] as String?,
  stockAt:
      json['stock_at'] == null
          ? null
          : DateTime.parse(json['stock_at'] as String),
  type: json['type'] as String?,
);

Map<String, dynamic> _$StoresDtoToJson(StoresDto instance) => <String, dynamic>{
  'addr': instance.addr,
  'code': instance.code,
  'created_at': instance.createdAt?.toIso8601String(),
  'lat': instance.lat,
  'lng': instance.lng,
  'name': instance.name,
  'remain_state': instance.remainState,
  'stock_at': instance.stockAt?.toIso8601String(),
  'type': instance.type,
};
