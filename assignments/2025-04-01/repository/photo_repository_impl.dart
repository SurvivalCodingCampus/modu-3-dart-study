import '../data_source/photo_data_source.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  const PhotoRepositoryImpl({required PhotoDataSource dataSource})
    : _dataSource = dataSource;
  
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    List<Map<String, dynamic>> allPhotos = await _dataSource.getAllPhotos();
    return allPhotos
        .map((e) => Photo.fromJson(e))
        .where((element) => element.albumId == albumId)
        .toList();
  }
}
