// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Store _$StoreFromJson(Map<String, dynamic> json) => _Store(
  addr: json['addr'] as String,
  code: json['code'] as String,
  createdAt: json['createdAt'] as String,
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  name: json['name'] as String,
  remainStat: json['remainStat'] as String,
  stockAt: json['stockAt'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$StoreToJson(_Store instance) => <String, dynamic>{
  'addr': instance.addr,
  'code': instance.code,
  'createdAt': instance.createdAt,
  'lat': instance.lat,
  'lng': instance.lng,
  'name': instance.name,
  'remainStat': instance.remainStat,
  'stockAt': instance.stockAt,
  'type': instance.type,
};
