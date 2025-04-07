import 'package:modu_3_dart_study/2025-04-04/extension/date_time_extension.dart';
import 'package:modu_3_dart_study/2025-04-04/model/enum/photo_type.dart';

import '../dto/photo_dto.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: '$id',
      type: type.toPhotoType(),
      title: title ?? '제목 없음',
      content: content ?? '내용 없음',
      url: url ?? '',
      caption: caption ?? '',
      createdAt: createdAt.toDateTime(format: 'yyyy-MM-dd') ?? DateTime(1970, 1, 1),
    );
  }
}
