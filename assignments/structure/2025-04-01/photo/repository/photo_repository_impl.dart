import '../data_source/photo_data_source.dart';
import '../model/photo.dart';
import 'photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final resp = await _dataSource.getPhotos();
    final data =
        resp
            .map((e) => Photo.fromJson(e))
            .where((e) => e.albumId == albumId)
            .toList();
    return data;
  }
}
