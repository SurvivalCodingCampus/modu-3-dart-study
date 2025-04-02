import '../model/album.dart';

abstract interface class AlbumRepository {
  List<Album> getAlbums({int? limit});
}
