import '../dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos();

}