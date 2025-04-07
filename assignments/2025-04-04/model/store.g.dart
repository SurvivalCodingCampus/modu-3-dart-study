// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
  addr: json['addr'] as String,
  code: (json['code'] as num).toInt(),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  name: json['name'] as String,
  remainStat: $enumDecodeNullable(_$StoreRemainStatEnumMap, json['remainStat']),
  stockAt:
      json['stockAt'] == null
          ? null
          : DateTime.parse(json['stockAt'] as String),
  type: json['type'] as String,
);

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
  'addr': instance.addr,
  'code': instance.code,
  'createdAt': instance.createdAt?.toIso8601String(),
  'lat': instance.lat,
  'lng': instance.lng,
  'name': instance.name,
  'remainStat': _$StoreRemainStatEnumMap[instance.remainStat],
  'stockAt': instance.stockAt?.toIso8601String(),
  'type': instance.type,
};

const _$StoreRemainStatEnumMap = {
  StoreRemainStat.plenty: 'plenty',
  StoreRemainStat.some: 'some',
  StoreRemainStat.few: 'few',
  StoreRemainStat.empty: 'empty',
  StoreRemainStat.break_: 'break_',
};
