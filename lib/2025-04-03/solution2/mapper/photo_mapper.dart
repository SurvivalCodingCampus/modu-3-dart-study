import 'package:modu_3_dart_study/2025-04-03/solution2/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id is int
          ? id
          : id is String
            ? int.tryParse(id) ?? 0
            : 0,
      type: _mapType(type),
      title: title ?? '',
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: DateTime.tryParse(createdAt ?? '') ?? DateTime(1970, 1, 1),
    );
  }

  ContentType _mapType(String? type) {
    switch (type?.toLowerCase()) {
      case 'article':
        return ContentType.article;
      case 'image':
        return ContentType.image;
      case 'video':
        return ContentType.video;
      default:
        return ContentType.unknown;
    }
  }
}