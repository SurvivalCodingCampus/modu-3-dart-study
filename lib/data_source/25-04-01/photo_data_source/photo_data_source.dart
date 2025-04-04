import '../../../model/25-04-01/photo.dart';

abstract interface class PhotoDataSource {
  Future<List<Photo>> getPhotos();
}
