import 'package:modu_3_dart_study/data_source/album_data_source/album_data_source.dart';
import 'package:modu_3_dart_study/model/album.dart';
import 'package:modu_3_dart_study/repository/album_repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource dataSource;
  AlbumRepositoryImpl({required this.dataSource});

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final allAlbums = await dataSource.getAlbums();
    // (조건) ? (참일때 실행) : (거짓일 때 실행);
    return limit != null ? allAlbums.take(limit).toList() : allAlbums;
  }
}
