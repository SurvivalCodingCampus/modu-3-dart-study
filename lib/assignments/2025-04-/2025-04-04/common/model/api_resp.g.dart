// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResp _$ApiRespFromJson(Map<String, dynamic> json) => ApiResp(
  count: (json['count'] as num).toInt(),
  stores:
      (json['stores'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
);

Map<String, dynamic> _$ApiRespToJson(ApiResp instance) => <String, dynamic>{
  'count': instance.count,
  'stores': instance.stores,
};
