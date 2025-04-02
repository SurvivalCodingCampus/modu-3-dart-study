import 'package:modu_3_dart_study/2025-04-01/solution2/data_source/photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getPhotos() async {
    return [
      {
        "albumId": 1,
        "id": 1,
        "title": "accusamus beatae ad facilis cum similique qui sunt",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952"
      },
      {
        "albumId": 1,
        "id": 2,
        "title": "reprehenderit est deserunt velit ipsam",
        "url": "https://via.placeholder.com/600/771796",
        "thumbnailUrl": "https://via.placeholder.com/150/771796"
      }
    ];
  }
}