import 'package:modu_3_dart_study/PR2025-04-01/albums/model/album.dart';
import 'package:modu_3_dart_study/PR2025-04-01/albums/repository/album_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('album test', () {
    test('limit 지정했을때 test', () async {
      const int limit = 3;
      AlbumRepositoryImpl albumRepositoryImpl = AlbumRepositoryImpl();
      List<Album> albums = await albumRepositoryImpl.getAlbumByLimit(
        limit: limit,
      );
      expect(albums.length, limit);
    });
  });
  group('album test', () {
    test('limit 지정하지 않았을때 test', () async {
      AlbumRepositoryImpl albumRepositoryImpl = AlbumRepositoryImpl();
      List<Album> albums = await albumRepositoryImpl.getAlbumByLimit();
      expect(albums.length, 100);
    });
  });
}
