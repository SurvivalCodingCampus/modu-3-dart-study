import '../../model/photo.dart';
import '../photo_repository.dart';

class MockPhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final data = [
      Photo(albumId: 1, id: 1, title: 'title', url: 'url', thumbnailUrl: 'thumbnailUrl'),
      Photo(albumId: 1, id: 1, title: 'title', url: 'url', thumbnailUrl: 'thumbnailUrl'),
      Photo(albumId: 1, id: 1, title: 'title', url: 'url', thumbnailUrl: 'thumbnailUrl'),
      Photo(albumId: 2, id: 1, title: 'title', url: 'url', thumbnailUrl: 'thumbnailUrl'),
      Photo(albumId: 2, id: 1, title: 'title', url: 'url', thumbnailUrl: 'thumbnailUrl'),
    ];
    final photos = data.where((e) => e.albumId == albumId).toList();
    return photos;
  }
}