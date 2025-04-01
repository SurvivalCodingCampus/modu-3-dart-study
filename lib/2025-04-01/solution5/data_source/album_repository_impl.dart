import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/solution5/model/album.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final List<Map<String, dynamic>> _dataSoure;

  @override
  Future<List<Album>> getAlbums({int? limit}) async {
    List<Album> albumList = [];

    if (limit == null) {
      for (Map<String, dynamic> items in _dataSoure) {
        albumList.add(Album.fromMap(items));
      }
    } else {
      for (int i = 0; i < limit; i++) {
        albumList.add(Album.fromMap(_dataSoure[i]));
      }
    }

    return albumList;
  }

  AlbumRepositoryImpl({required List<Map<String, dynamic>> dataSoure})
    : _dataSoure = dataSoure;
}
