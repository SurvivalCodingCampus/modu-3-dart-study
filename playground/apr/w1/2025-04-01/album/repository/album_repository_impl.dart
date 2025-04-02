import '../data_source/album_data_source.dart';
import '../model/album.dart';
import 'album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final albumData = await _albumDataSource.getAlbums();

    if (limit == null) {
      return albumData.map((e) => Album.fromJson(e)).toList();
    } else {
      return albumData.map((e) => Album.fromJson(e)).take(limit).toList();
    }
  }
}
