import 'package:modu_3_dart_study/2025-04-01/solution5/data_source/album_data_source.dart';

class MockAlbumDataSourceImpl implements AlbumDataSource {
  @override
  List<Map<String, dynamic>> getAlbums() {
    return [
      {
        "userId": 1,
        "id": 1,
        "title": "quidem molestiae enim"
      },
      {
        "userId": 1,
        "id": 2,
        "title": "sunt qui excepturi placeat culpa"
      },
      {
        "userId": 1,
        "id": 3,
        "title": "omnis laborum odio"
      }
    ];
  }
}