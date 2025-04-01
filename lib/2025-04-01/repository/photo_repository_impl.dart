import '../data_source/photo_datasource.dart';
import '../model/photo.dart';
import 'interface/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDatasource _datasource;

  PhotoRepositoryImpl(this._datasource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final raw = await _datasource.fetchPhotos();
    return raw
        .where((e) => e['albumId'] == albumId)
        .map((e) => Photo.fromJson(e))
        .toList();
  }
}
