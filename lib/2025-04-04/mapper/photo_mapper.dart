import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-04/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toModel() {
    return Photo(
      id: _parseId(id),
      type: _mapType(type),
      title: title,
      content: content,
      url: url,
      caption: caption,
      createdAt: _parseDate(createdAt),
    );
  }

  int _parseId(dynamic id) {
    if (id is int) return id;
    if (id is String) return int.tryParse(id) ?? 0;
    return 0;
  }

  PhotoType _mapType(String? type) {
    switch (type?.toLowerCase()) {
      case 'article':
        return PhotoType.article;
      case 'image':
        return PhotoType.image;
      case 'video':
        return PhotoType.video;
      default:
        return PhotoType.unknown;
    }
  }

  DateTime? _parseDate(String? dateStr) {
    if (dateStr == null) return null;
    try {
      return DateTime.parse(dateStr);
    } catch (_) {
      return null;
    }
  }
}