import '../data_source/album_data_source.dart';

class MockAlbumDataSourceImpl implements AlbumDataSource {
  @override
  Future<List<Map<String, dynamic>>> getAlbums() async {
    return [
      {"userId": 10, "id": 94, "title": "quisquam a dolores et earum vitae"},
      {
        "userId": 10,
        "id": 95,
        "title": "consectetur vel rerum qui aperiam modi eos aspernatur ipsa",
      },
      {
        "userId": 10,
        "id": 96,
        "title": "unde et ut molestiae est molestias voluptatem sint",
      },
      {"userId": 10, "id": 97, "title": "est quod aut"},
      {
        "userId": 10,
        "id": 98,
        "title": "omnis quia possimus nesciunt deleniti assumenda sed autem",
      },
      {
        "userId": 10,
        "id": 99,
        "title": "consectetur ut id impedit dolores sit ad ex aut",
      },
      {"userId": 10, "id": 100, "title": "enim repellat iste"},
    ];
  }
}
