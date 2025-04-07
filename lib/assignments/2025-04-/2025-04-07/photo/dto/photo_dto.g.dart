// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto(
  tags: json['tags'] as String?,
  previewURL: json['previewURL'] as String?,
);

Map<String, dynamic> _$PhotoDtoToJson(PhotoDto instance) => <String, dynamic>{
  'tags': instance.tags,
  'previewURL': instance.previewURL,
};

PhotoResultDto _$PhotoResultDtoFromJson(Map<String, dynamic> json) =>
    PhotoResultDto(
      total: (json['total'] as num?)?.toInt(),
      totalHits: (json['totalHits'] as num?)?.toInt(),
      hits:
          (json['hits'] as List<dynamic>)
              .map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PhotoResultDtoToJson(PhotoResultDto instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits.map((e) => e.toJson()).toList(),
    };
