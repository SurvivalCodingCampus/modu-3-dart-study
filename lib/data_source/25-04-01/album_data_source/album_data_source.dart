import '../../../model/25-04-01/album.dart';

abstract interface class AlbumDataSource {
  Future<List<Album>> getAlbums();
}
