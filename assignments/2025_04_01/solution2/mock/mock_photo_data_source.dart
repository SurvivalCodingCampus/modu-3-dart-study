import '../data_source/photo_data_source.dart';

class MockPhotoDataSource implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getPhotos() async {
    return [
      {
        "albumId": 100,
        "id": 4997,
        "title": "sunt amet autem exercitationem fuga consequatur",
        "url": "https://via.placeholder.com/600/13454b",
        "thumbnailUrl": "https://via.placeholder.com/150/13454b",
      },
      {
        "albumId": 100,
        "id": 4998,
        "title": "qui quo cumque distinctio aut voluptas",
        "url": "https://via.placeholder.com/600/315aa6",
        "thumbnailUrl": "https://via.placeholder.com/150/315aa6",
      },
      {
        "albumId": 100,
        "id": 4999,
        "title": "in voluptate sit officia non nesciunt quis",
        "url": "https://via.placeholder.com/600/1b9d08",
        "thumbnailUrl": "https://via.placeholder.com/150/1b9d08",
      },
    ];
  }
}
