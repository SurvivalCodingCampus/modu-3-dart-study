// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mask.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Mask _$MaskFromJson(Map<String, dynamic> json) => _Mask(
  name: json['name'] as String,
  address: json['address'] as String,
  remainStat: json['remainStat'] as String,
  stockAt: DateTime.parse(json['stockAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  code: (json['code'] as num).toInt(),
);

Map<String, dynamic> _$MaskToJson(_Mask instance) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'remainStat': instance.remainStat,
  'stockAt': instance.stockAt.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'lat': instance.lat,
  'lng': instance.lng,
  'code': instance.code,
};
