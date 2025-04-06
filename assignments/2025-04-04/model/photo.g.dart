// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
  id: (json['id'] as num).toInt(),
  type: $enumDecodeNullable(_$PhotoTypeEnumMap, json['type']),
  title: json['title'] as String,
  content: json['content'] as String,
  url: json['url'] as String,
  caption: json['caption'] as String,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$PhotoTypeEnumMap[instance.type],
  'title': instance.title,
  'content': instance.content,
  'url': instance.url,
  'caption': instance.caption,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$PhotoTypeEnumMap = {
  PhotoType.article: 'article',
  PhotoType.image: 'image',
  PhotoType.video: 'video',
  PhotoType.unknown: 'unknown',
};
