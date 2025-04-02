import 'package:modu_3_dart_study/2025-04-01/data_source/photo_data_source.dart';

class MockPhotoDataSource implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAllPhotos() async {
    return [
      {
        "albumId": 1,
        "id": 1,
        "title": "Test Title",
        "url": "https://via.placeholder.com/600/test",
        "thumbnailUrl": "https://via.placeholder.com/150/test"
      },
      {
        "albumId": 2,
        "id": 2,
        "title": "Another Title",
        "url": "https://via.placeholder.com/600/another",
        "thumbnailUrl": "https://via.placeholder.com/150/another"
      }
    ];
  }
}