// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
  dates: Dates.fromJson(json['dates'] as Map<String, dynamic>),
  page: (json['page'] as num).toInt(),
  results:
      (json['results'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
);

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates.toJson(),
      'page': instance.page,
      'results': instance.results,
    };
