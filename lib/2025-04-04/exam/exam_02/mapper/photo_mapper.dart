import 'package:modu_3_dart_study/2025-04-04/exam/exam_02/dto/photo_dto.dart';

import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      createdAt: DateTime.tryParse(createdAt ?? '') ?? DateTime(1970),
      type: switch (type) {
        'video' => Type.video,
        'image' => Type.image,
        'article' => Type.article,
        _ => Type.unknown,
      },
      url: url ?? '',
      title: title ?? '',
    );
  }
}
