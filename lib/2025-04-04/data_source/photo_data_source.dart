import 'package:modu_3_dart_study/2025-04-04/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos();
}
