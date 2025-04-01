import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/model/album.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  List<Album> getAlbums({int? limit}) {
    final albumList = _albumDataSource.getAlbums();
    return albumList
        .map((e) => Album.fromJson(e))
        .take(limit ?? albumList.length)
        .toList();
  }
}