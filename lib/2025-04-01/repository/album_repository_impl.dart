import '../data_source/album_datasource.dart';
import '../model/album.dart';
import 'interface/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDatasource _datasource;

  AlbumRepositoryImpl(this._datasource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final raw = await _datasource.fetchAlbums();
    final albums = raw.map((e) => Album.fromJson(e)).toList();
    if (limit != null && limit < albums.length) {
      return albums.take(limit).toList();
    }
    return albums;
  }
}
