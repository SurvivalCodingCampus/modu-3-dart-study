import 'package:modu_3_dart_study/2025-04-01/model/album.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
