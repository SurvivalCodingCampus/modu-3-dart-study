import '../../model/album.dart';

abstract interface class AlbumDataSource {
  Future<List<Album>> getAlbums();
}