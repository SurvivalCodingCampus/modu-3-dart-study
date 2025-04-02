import 'package:modu_3_dart_study/2025-04-01/solution5/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums({int? limit});
}
