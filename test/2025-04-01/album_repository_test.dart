import 'package:collection/collection.dart';
import 'package:test/test.dart';

import '../../assignment/2025-04-01/data_source/album_data_source.dart';
import '../../assignment/2025-04-01/model/album.dart';
import '../../assignment/2025-04-01/repository/album_repository.dart';
import '../../assignment/2025-04-01/repository/album_repository_impl.dart';

class MockAlbumDataSource implements AlbumDataSource {
  static const List<Map<String, dynamic>> mockJsonAlbums = [
    {"userId": 1, "id": 1, "title": "quidem molestiae enim"},
    {"userId": 1, "id": 2, "title": "sunt qui excepturi placeat culpa"},
    {"userId": 1, "id": 3, "title": "omnis laborum odio"},
    {"userId": 1, "id": 4, "title": "non esse culpa molestiae omnis sed optio"},
    {"userId": 1, "id": 5, "title": "eaque aut omnis a"},
    {"userId": 1, "id": 6, "title": "natus impedit quibusdam illo est"},
    {"userId": 1, "id": 7, "title": "quibusdam autem aliquid et et quia"},
    {"userId": 1, "id": 8, "title": "qui fuga est a eum"},
    {"userId": 1, "id": 9, "title": "saepe unde necessitatibus rem"},
    {"userId": 1, "id": 10, "title": "distinctio laborum qui"},
    {
      "userId": 2,
      "id": 11,
      "title": "quam nostrum impedit mollitia quod et dolor",
    },
    {
      "userId": 2,
      "id": 12,
      "title": "consequatur autem doloribus natus consectetur",
    },
    {
      "userId": 2,
      "id": 13,
      "title": "ab rerum non rerum consequatur ut ea unde",
    },
    {"userId": 2, "id": 14, "title": "ducimus molestias eos animi atque nihil"},
    {
      "userId": 2,
      "id": 15,
      "title": "ut pariatur rerum ipsum natus repellendus praesentium",
    },
    {
      "userId": 2,
      "id": 16,
      "title": "voluptatem aut maxime inventore autem magnam atque repellat",
    },
    {"userId": 2, "id": 17, "title": "aut minima voluptatem ut velit"},
    {"userId": 2, "id": 18, "title": "nesciunt quia et doloremque"},
    {
      "userId": 2,
      "id": 19,
      "title": "velit pariatur quaerat similique libero omnis quia",
    },
    {"userId": 2, "id": 20, "title": "voluptas rerum iure ut enim"},
    {
      "userId": 3,
      "id": 21,
      "title":
          "repudiandae voluptatem optio est consequatur rem in temporibus et",
    },
    {"userId": 3, "id": 22, "title": "et rem non provident vel ut"},
    {"userId": 3, "id": 23, "title": "incidunt quisquam hic adipisci sequi"},
    {"userId": 3, "id": 24, "title": "dolores ut et facere placeat"},
    {
      "userId": 3,
      "id": 25,
      "title": "vero maxime id possimus sunt neque et consequatur",
    },
  ];

  @override
  Future<List<Map<String, dynamic>>> fetchAlbums(String path) async {
    return mockJsonAlbums;
  }
}

void main() {
  AlbumDataSource mockAlbumsDataSource = MockAlbumDataSource();
  AlbumRepository albumRepository = AlbumRepositoryImpl(
    albumDataSource: mockAlbumsDataSource,
  );

  group('Album Repository 테스트', () {
    test('getAlbums() -> 정상적으로 Albums 반환해야하며, limit도 잘 동작해야 한다.', () async {
      const limit = 5;
      final mockAlbums =
          MockAlbumDataSource.mockJsonAlbums
              .map((e) => Album.fromJson(e))
              .toList();
      final limitFiveMockAlbums =
          MockAlbumDataSource.mockJsonAlbums
              .map((e) => Album.fromJson(e))
              .take(limit)
              .toList();

      final albums = await albumRepository.getAlbums();
      final limitFiveAlbums = await albumRepository.getAlbums(limit: limit);

      expect(ListEquality().equals(albums, mockAlbums), isTrue);
      expect(
        ListEquality().equals(limitFiveAlbums, limitFiveMockAlbums),
        isTrue,
      );
    });
  });
}
