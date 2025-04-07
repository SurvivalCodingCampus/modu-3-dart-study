import 'package:modu_3_dart_study/2025-04-04/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/enums/photo_enum.dart';

import '../model/photo.dart';

extension ToPhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: int.parse(id?.toString() ?? '0'),
      type: type ?? PhotoEnum.unknown,
      caption: caption ?? '정보 없음',
      title: title ?? '정보 없음',
      content: content ?? '정보 없음',
      createdAt: DateTime.parse(createdAt ?? '1970-01-01'),
    );
  }
}
