import '../../model/25-04-04/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotoList();
}
