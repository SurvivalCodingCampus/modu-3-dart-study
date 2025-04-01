import '../data_source/album_data_source.dart';
import '../model/album.dart';
import 'album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl({required AlbumDataSource albumDataSource})
    : _albumDataSource = albumDataSource;

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final albums = await _albumDataSource.getAlbums();

    if (limit == null) {
      return albums.map((e) => Album.fromJson(e)).toList();
    }

    return albums.map((e) => Album.fromJson(e)).take(limit).toList();
  }
}
