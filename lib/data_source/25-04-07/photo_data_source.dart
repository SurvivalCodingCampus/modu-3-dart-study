import '../../dto/25-04-07/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getImages(String query);
}
