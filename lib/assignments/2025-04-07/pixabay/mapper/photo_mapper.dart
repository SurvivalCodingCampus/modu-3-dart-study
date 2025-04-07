
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/dto/photo_dto.dart';
import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    final photoTags = tags.split(', ');
    return Photo(tags: photoTags, imageUrl: largeImageURL);
  }
}
