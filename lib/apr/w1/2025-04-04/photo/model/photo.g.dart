// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Photo _$PhotoFromJson(Map<String, dynamic> json) => _Photo(
  id: (json['id'] as num).toInt(),
  type: $enumDecode(_$PhotoTypeEnumMap, json['type']),
  title: json['title'] as String,
  url: json['url'] as String,
  content: json['content'] as String,
  caption: json['caption'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$PhotoTypeEnumMap[instance.type]!,
  'title': instance.title,
  'url': instance.url,
  'content': instance.content,
  'caption': instance.caption,
  'createdAt': instance.createdAt.toIso8601String(),
};

const _$PhotoTypeEnumMap = {
  PhotoType.Article: 'article',
  PhotoType.Image: 'image',
  PhotoType.Video: 'video',
  PhotoType.Unknown: 'unknown',
};
