import '../../model/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}
