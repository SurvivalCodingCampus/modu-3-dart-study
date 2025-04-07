import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-07/photo/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<PhotoResultDto> getPhotos(List<String> tags);
}