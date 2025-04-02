import 'package:modu_3_dart_study/2025-04/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/2025-04/data_source.dart';
import 'package:modu_3_dart_study/2025-04/repository.dart';

class PhotoRepository implements Repository<Photo, int> {
  final DataSource<Photo> _source;

  const PhotoRepository(this._source);

  @override
  Future<List<Photo>> findAll() async {
    return await _source.load();
  }

  @override
  Future<Photo> findOne(int albumId) async {
    List<Photo> photos = await _source.load();
    return photos.firstWhere((e) => e.albumId == albumId);
  }

  Future<List<Photo>> getPhotos(int albumId) async {
    List<Photo> photos = await _source.load();
    return photos.where((e) => e.albumId == albumId).toList();
  }
}
