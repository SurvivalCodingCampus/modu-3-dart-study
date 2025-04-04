import 'package:modu_3_dart_study/assignments/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/model/photo.dart';
import 'package:modu_3_dart_study/assignments/2025-04-04/photo/util/type_enum.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    PhotoType photoType = PhotoType.Unknown;
    if (type == 'article') {
      photoType = PhotoType.Article;
    } else if (type == 'image') {
      photoType = PhotoType.Image;
    } else if (type == 'video') {
      photoType = PhotoType.Video;
    }

    DateTime photoCreateAt =
        DateTime.tryParse(createdAt!) ?? DateTime(1999, 1, 1);

    return Photo(
      id: _parseId(id),
      type: photoType,
      title: title ?? '',
      content: content ?? '',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: photoCreateAt,
    );
  }

  int _parseId(Object? idValue) {
    if (idValue == null) return 0;
    try {
      if (idValue is int) return idValue;
      return int.parse(idValue.toString());
    } catch (e) {
      return 0; // 또는 다른 기본값 또는 예외 처리
    }
  }
}
