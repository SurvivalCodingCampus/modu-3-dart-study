import 'package:intl/intl.dart';

import '../dto/photo_dto.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: id?.toInt() ?? 0,
      type: _mapStringToPhotoType(type),
      title: title ?? '',
      content: content ?? '',
      createdAt: _parseDate(createdAt),
    );
  }

  PhotoType _mapStringToPhotoType(String? type) {
    switch (type) {
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

  DateTime _parseDate(String? date) {
    if (date == null) {
      return DateTime.now();
    }
    try {
      return DateFormat('yyyy-MM-dd').parse(date);
    } catch (e) {
      return DateTime.now();
    }
  }
}
