import '../data_source/album_data_source.dart';
import '../model/album.dart';
import 'album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _dataSource;

  AlbumRepositoryImpl(this._dataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final resp = await _dataSource.getAlbums();
    final albums = resp.map((e) => Album.fromJson(e)).toList();
    if (limit == null) {
      return albums;
    }
    if(limit > albums.length){
      throw Exception('범위를 벗어났습니다.');
    }
    final limitedAlbums = albums.sublist(0, limit);
    return limitedAlbums;
  }
}
