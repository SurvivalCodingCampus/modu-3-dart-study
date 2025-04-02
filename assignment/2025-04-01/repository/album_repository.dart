import '../model/album.dart';

abstract interface class AlbumRepository {
  // limit 을 지정하지 않으면 모든 데이터를
  // limit 을 지정하면 limit 갯수만큼
  Future<List<Album>> getAlbums({int? limit});
}
