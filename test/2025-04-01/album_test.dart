import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_album_data_source.dart';
import 'package:modu_3_dart_study/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/album_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/album_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('[ Album Model Class ] -', () {
    test('fromJson() json 데이터로 정확한 album 객체를 생성해야한다. ', () {
      final jsonData = {
        "albumId": 1,
        "id": 1,
        "title": "Test Album",
        "url": "https://test.com",
        "thumbnailUrl": "https://test.com/thumb"
      };
      final album = Album.fromJson(jsonData);

      expect(album.albumId, 1);
      expect(album.id, 1);
      expect(album.title, "Test Album");
      expect(album.url, "https://test.com");
      expect(album.thumbnailUrl, "https://test.com/thumb");
    });

    test('toJson() Album 객체로 정확한 JSON map을 생성해야한다.', () {
      final album = Album(
        albumId: 1,
        id: 1,
        title: "Test Album",
        url: "https://test.com",
        thumbnailUrl: "https://test.com/thumb",
      );
      final jsonMap = album.toJson();

      expect(jsonMap["albumId"], 1);
      expect(jsonMap["id"], 1);
      expect(jsonMap["title"], "Test Album");
      expect(jsonMap["url"], "https://test.com");
      expect(jsonMap["thumbnailUrl"], "https://test.com/thumb");
    });
  });

  group('[ AlbumRepository ] - ', () {
    MockAlbumDataSource mockDataSource = MockAlbumDataSource();
    AlbumRepository repository = AlbumRepositoryImpl(mockDataSource);



    test('getAlbums() should return all albums when no limit is specified', () async {
      final albums = await repository.getAlbums();

      expect(albums.length, 3);
      expect(albums.first.title, "Test Album 1");
    });

    test('getAlbums(limit: 2) should return only the first 2 albums', () async {
      final albums = await repository.getAlbums(limit: 2);

      expect(albums.length, 2);
      expect(albums[0].title, "Test Album 1");
      expect(albums[1].title, "Test Album 2");
    });
  });
}