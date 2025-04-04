import '../data_source/album_data_source.dart';
import '../data_source/local/album_data_source_impl.dart';
import '../model/album.dart';
import 'album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl({AlbumDataSource? albumDataSource})
    : _albumDataSource = albumDataSource ?? AlbumDataSourceImpl();

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    const path = 'assignment/2025-04-01/assets/albums.json';
    final json = await _albumDataSource.fetchAlbums(path);
    final elementsCount = json.length;
    return json
        .map((e) => Album.fromJson(e))
        .take(limit ?? elementsCount)
        .toList();
  }
}
