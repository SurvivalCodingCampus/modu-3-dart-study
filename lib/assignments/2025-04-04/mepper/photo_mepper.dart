import 'package:intl/intl.dart';

import '../dto/photo_dto.dart';
import '../model/photo.dart';
import '../model/photo_type.dart';

extension PhotoMepper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: int.tryParse(id ?? '') ?? -1,
      type: _parsePhotoType(type),
      createdAt: _parseDateTime(createdAt),
      title: title ?? '',
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
    );
  }
}

DateTime? _parseDateTime(String? createdAt) {
  if (createdAt == null || createdAt.isEmpty) return null;
  try {
    return DateFormat('yyyy-MM-dd').parse(createdAt);
  } catch (e) {
    return null;
  }
}

PhotoType? _parsePhotoType(String? type) {
  switch (type) {
    case 'article':
      return PhotoType.article;
    case 'image':
      return PhotoType.image;
    case 'video':
      return PhotoType.video;
    case 'unknown':
      return PhotoType.unknown;
    default:
      return null;
  }
}
