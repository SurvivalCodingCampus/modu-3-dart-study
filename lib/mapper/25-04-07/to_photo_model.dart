import '../../dto/25-04-07/photo_dto.dart';
import '../../model/25-04-07/photo.dart';

extension ToPhotoModel on PhotoDto {
  Photo toPhotoModel() {
    return Photo(tags: tags ?? '이름 없음', imageUrl: largeImageURL ?? '이미지 없음');
  }
}
