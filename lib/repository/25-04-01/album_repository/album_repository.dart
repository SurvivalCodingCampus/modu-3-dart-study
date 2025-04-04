import '../../../model/25-04-01/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();
}
