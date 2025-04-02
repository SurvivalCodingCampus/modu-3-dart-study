import '../../model/Photo.dart';

abstract interface class PhotoDataSource {
  Future<List<Photo>> getPhotos();
}
