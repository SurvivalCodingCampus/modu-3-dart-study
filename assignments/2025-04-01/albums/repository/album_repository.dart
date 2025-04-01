import 'package:modu_3_dart_study/PR2025-04-01/albums/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbumByLimit({int? limit});
}
