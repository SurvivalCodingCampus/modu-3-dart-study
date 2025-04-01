import 'package:modu_3_dart_study/2025-04-01/data_source/album_data_source.dart';

class MockAlbumDataSource implements AlbumDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllAlbums() async {
    return [
      {
        "albumId": 1,
        "id": 1,
        "title": "Test Album 1",
        "url": "https://test.com/1",
        "thumbnailUrl": "https://test.com/thumb1"
      },
      {
        "albumId": 1,
        "id": 2,
        "title": "Test Album 2",
        "url": "https://test.com/2",
        "thumbnailUrl": "https://test.com/thumb2"
      },
      {
        "albumId": 2,
        "id": 3,
        "title": "Test Album 3",
        "url": "https://test.com/3",
        "thumbnailUrl": "https://test.com/thumb3"
      },
    ];
  }
}
