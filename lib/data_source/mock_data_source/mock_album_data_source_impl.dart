import 'package:modu_3_dart_study/model/album.dart';

import '../album_data_source/album_data_source.dart';

class MockAlbumDataSourceImpl implements AlbumDataSource {
  @override
  Future<List<Album>> getAlbums() async {
    final jsonData = [
      {"userId": 1, "id": 1, "title": "Rosie"},
      {"userId": 1, "id": 2, "title": "꽃갈피"},
      {"userId": 1, "id": 3, "title": "야호(夜好）"},
    ];
    return jsonData.map((e) => Album.fromJson(e)).toList();
  }
}
