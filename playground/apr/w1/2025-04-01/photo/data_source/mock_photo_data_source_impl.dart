import 'photo_data_source.dart';

class MockPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Map<String, dynamic>>> getPhotos(int albumId) async {
    final photoList = [
      {
        "albumId": 1,
        "id": 43,
        "title": "eius hic autem ad beatae voluptas",
        "url": "https://via.placeholder.com/600/6ad437",
        "thumbnailUrl": "https://via.placeholder.com/150/6ad437",
      },
      {
        "albumId": 1,
        "id": 44,
        "title": "neque eum provident et inventore sed ipsam dignissimos quo",
        "url": "https://via.placeholder.com/600/29fe9f",
        "thumbnailUrl": "https://via.placeholder.com/150/29fe9f",
      },
      {
        "albumId": 1,
        "id": 45,
        "title":
            "praesentium fugit quis aut voluptatum commodi dolore corrupti",
        "url": "https://via.placeholder.com/600/c4084a",
        "thumbnailUrl": "https://via.placeholder.com/150/c4084a",
      },
      {
        "albumId": 1,
        "id": 46,
        "title": "quidem maiores in quia fugit dolore explicabo occaecati",
        "url": "https://via.placeholder.com/600/e9b68",
        "thumbnailUrl": "https://via.placeholder.com/150/e9b68",
      },
      {
        "albumId": 1,
        "id": 47,
        "title": "et soluta est",
        "url": "https://via.placeholder.com/600/b4412f",
        "thumbnailUrl": "https://via.placeholder.com/150/b4412f",
      },
      {
        "albumId": 1,
        "id": 48,
        "title": "ut esse id",
        "url": "https://via.placeholder.com/600/68e0a8",
        "thumbnailUrl": "https://via.placeholder.com/150/68e0a8",
      },
      {
        "albumId": 1,
        "id": 49,
        "title": "quasi quae est modi quis quam in impedit",
        "url": "https://via.placeholder.com/600/2cd88b",
        "thumbnailUrl": "https://via.placeholder.com/150/2cd88b",
      },
      {
        "albumId": 1,
        "id": 50,
        "title": "et inventore quae ut tempore eius voluptatum",
        "url": "https://via.placeholder.com/600/9e59da",
        "thumbnailUrl": "https://via.placeholder.com/150/9e59da",
      },
      {
        "albumId": 2,
        "id": 51,
        "title": "non sunt voluptatem placeat consequuntur rem incidunt",
        "url": "https://via.placeholder.com/600/8e973b",
        "thumbnailUrl": "https://via.placeholder.com/150/8e973b",
      },
      {
        "albumId": 2,
        "id": 52,
        "title": "eveniet pariatur quia nobis reiciendis laboriosam ea",
        "url": "https://via.placeholder.com/600/121fa4",
        "thumbnailUrl": "https://via.placeholder.com/150/121fa4",
      },
      {
        "albumId": 2,
        "id": 53,
        "title": "soluta et harum aliquid officiis ab omnis consequatur",
        "url": "https://via.placeholder.com/600/6efc5f",
        "thumbnailUrl": "https://via.placeholder.com/150/6efc5f",
      },
    ];

    return photoList.where((e) => e['albumId'] == albumId).toList();
  }
}
