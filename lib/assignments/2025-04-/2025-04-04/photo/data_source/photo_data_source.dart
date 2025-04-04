import 'package:modu_3_dart_study/assignments/2025-04-/2025-04-04/photo/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> fetchPhotos();
}
