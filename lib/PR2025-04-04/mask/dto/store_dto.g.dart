// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) => StoreDto(
  addr: json['addr'] as String?,
  code: json['code'] as String?,
  created_at: json['created_at'] as String?,
  lat: json['lat'] as num?,
  lng: json['lng'] as num?,
  name: json['name'] as String?,
  remain_stat: json['remain_stat'] as String?,
  stock_at: json['stock_at'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$StoreDtoToJson(StoreDto instance) => <String, dynamic>{
  'addr': instance.addr,
  'code': instance.code,
  'created_at': instance.created_at,
  'lat': instance.lat,
  'lng': instance.lng,
  'name': instance.name,
  'remain_stat': instance.remain_stat,
  'stock_at': instance.stock_at,
  'type': instance.type,
};
