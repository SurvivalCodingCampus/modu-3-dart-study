import 'package:modu_3_dart_study/2025-04-01/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource dataSource;

  AlbumRepositoryImpl(this.dataSource);

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final rawAlbums = await dataSource.getAllAlbums();
    List<Album> albums = rawAlbums
        .map((json) => Album.fromJson(json))
        .toList();

    if (limit != null) {
      return albums.take(limit).toList();
    }
    return albums;
  }
}