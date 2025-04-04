import '../data_source/photo_data_source.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource photoDataSource;

  PhotoRepositoryImpl(this.photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    try {
      final photosJson = await photoDataSource.fetchPhotos(albumId);
      return _mapToPhotos(photosJson);
    } catch (e) {
      throw Exception('Failed to fetch Photos: $e');
    }
  }

  List<Photo> _mapToPhotos(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((e) => Photo.fromJson(e)).toList();
  }
}