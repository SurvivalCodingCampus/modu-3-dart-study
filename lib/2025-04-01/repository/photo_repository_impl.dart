import '../data_source/local/photo_data_source_impl.dart';
import '../data_source/photo_data_source.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl({PhotoDataSource? photoDataSource})
    : _photoDataSource = photoDataSource ?? PhotoDataSourceImpl();

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    const path = 'assignment/2025-04-01/assets/photos.json';
    final json = await _photoDataSource.fetchPhotos(path);
    return json
        .map((e) => Photo.fromJson(e))
        .where((e) => e.albumId == albumId)
        .toList();
  }
}
