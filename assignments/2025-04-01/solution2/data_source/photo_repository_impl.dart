import '../model/photo.dart';
import 'photo_data_source.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final List<dynamic> fetchData = await _photoDataSource.fetchPhotos();

    List<Photo> photoList = [];

    if (fetchData.isNotEmpty) {
      fetchData.map((e) {
        if (e["albumId"] == albumId) {
          photoList.add(Photo.fromMap(e));
        }
      }).toList();
    }

    return photoList;
  }

  PhotoRepositoryImpl({required PhotoDataSource photoDataSource})
    : _photoDataSource = photoDataSource;
}
