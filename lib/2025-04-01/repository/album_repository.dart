import '../model/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
