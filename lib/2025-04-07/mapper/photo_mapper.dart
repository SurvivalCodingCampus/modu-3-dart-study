import '../dto/photo_dto.dart';
import '../model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(tags: tags ?? '', imageUrl: imageUrl ?? '');
  }
}
