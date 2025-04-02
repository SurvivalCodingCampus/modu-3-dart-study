import 'package:modu_3_dart_study/PR2025-04-01/albums/data_source/album_data_source.dart';
import 'package:modu_3_dart_study/PR2025-04-01/albums/model/album.dart';
import 'package:modu_3_dart_study/PR2025-04-01/albums/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  AlbumDataSource albumDataSource = AlbumDataSource();

  @override
  Future<List<Album>> getAlbumByLimit({int? limit}) async {
    List<Album> allAlbums = await albumDataSource.getAlbums();
    // limit가  존재할때는 take를 활용해 정해진 갯수만 출력, 아니라면 전부다 출력
    return (limit != null) ? allAlbums.take(limit).toList() : allAlbums;
  }
}
