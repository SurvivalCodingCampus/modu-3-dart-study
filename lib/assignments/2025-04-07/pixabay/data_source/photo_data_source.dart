import 'package:modu_3_dart_study/assignments/2025-04-07/pixabay/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos(String query);
}
