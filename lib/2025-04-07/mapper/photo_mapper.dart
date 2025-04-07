import 'package:modu_3_dart_study/2025-04-07/dto/photo_dto.dart';
import 'package:modu_3_dart_study/2025-04-07/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(tags: tags ?? '', imageUrl: largeImageURL ?? '');
  }
}
