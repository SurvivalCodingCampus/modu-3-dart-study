import '../../model/album.dart';
import '../album_repository.dart';

class MockAlbumRepositoryImpl implements AlbumRepository {
  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    final albums = [
      Album(userId: 1, id: 1, title: 'title'),
      Album(userId: 1, id: 1, title: 'title'),
      Album(userId: 1, id: 1, title: 'title'),
      Album(userId: 1, id: 1, title: 'title'),
      Album(userId: 1, id: 1, title: 'title'),
      Album(userId: 1, id: 1, title: 'title'),
    ];
    if(limit == null){
      return albums;
    }
    if(limit > albums.length){
      throw Exception('범위를 벗어났습니다.');
    }
    final limitedAlbums = albums.sublist(0, limit);
    return limitedAlbums;
  }
}