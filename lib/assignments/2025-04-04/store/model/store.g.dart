// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Store _$StoreFromJson(Map<String, dynamic> json) => _Store(
  address: json['address'] as String,
  code: json['code'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  name: json['name'] as String,
  remainStat: json['remainStat'] as String,
  stockAt: DateTime.parse(json['stockAt'] as String),
  type: json['type'] as String,
);

Map<String, dynamic> _$StoreToJson(_Store instance) => <String, dynamic>{
  'address': instance.address,
  'code': instance.code,
  'createdAt': instance.createdAt.toIso8601String(),
  'lat': instance.lat,
  'lng': instance.lng,
  'name': instance.name,
  'remainStat': instance.remainStat,
  'stockAt': instance.stockAt.toIso8601String(),
  'type': instance.type,
};
