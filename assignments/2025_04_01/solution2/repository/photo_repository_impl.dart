import '../data_source/photo_data_source.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final result = await _photoDataSource.getPhotos();

    return result
        .map((e) => Photo.fromJson(e))
        .where((e) => e.albumId == albumId)
        .toList();
  }
}
