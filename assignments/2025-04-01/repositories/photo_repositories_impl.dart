import '../models/photo.dart';
import 'photo_repositories.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource photoDataSource;

  PhotoRepositoryImpl({PhotoDataSource? photoDataSource})
      : photoDataSource = photoDataSource ?? PhotoDataSourceImpl();

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    const path = 'assignment/2025-04-01/assets/photos.json';
    final json = await photoDataSource.fetchPhotos(path);
    return json
        .map((e) => Photo.fromJson(e))
        .where((e) => e.albumId == albumId)
        .toList();
  }
}