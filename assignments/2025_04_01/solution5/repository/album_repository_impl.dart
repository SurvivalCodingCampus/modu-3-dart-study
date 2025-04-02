import '../data_source/album_data_source.dart';
import '../model/album.dart';
import 'album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final List<Map<String, dynamic>> albums =
        await _albumDataSource.getAlbums();

    final albumsList = albums
        .map((e) => Album.fromJson(e))
        .toList()
        .sublist(0, limit);

    return albumsList;
  }
}
