import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      tags: tags == null ? [] : tags!.split(','),
      previewURL: previewURL ?? '',
    );
  }
}
