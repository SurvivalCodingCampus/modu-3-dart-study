import 'package:test/test.dart';
import '../../../../../lib/assignments/structure/2025-04-01/album/data_source/local/album_local_data_source_impl.dart';
import '../../../../../lib/assignments/structure/2025-04-01/album/repository/album_repository.dart';
import '../../../../../lib/assignments/structure/2025-04-01/album/repository/album_repository_impl.dart';
import '../../../../../lib/assignments/structure/2025-04-01/album/repository/mock/mock_album_repository_impl.dart';

void main() {
  group('album repo test', () {
    group('album mock repo test', () {
      final repo = MockAlbumRepositoryImpl();
      test('album mock repo test', () async {
        final albums = await repo.getAlbums();

        expect(albums.length, equals(6));
      });

      test('album mock repo error test', () async {
        expect(() async {
          await repo.getAlbums(limit: 10);
        }, throwsA(isA<Exception>()));
      });
    });

    group('alnum repo test', () {
      final AlbumRepository repo = AlbumRepositoryImpl(
        AlbumLocalDataSourceImpl(),
      );
      test('album repo test', () async {
        final albums = await repo.getAlbums();
        final limitedAlbums = await repo.getAlbums(limit: 99);

        print(albums[0].toString());

        expect(albums.length, equals(100));
        expect(limitedAlbums.length, equals(99));
      });

      test('album repo error test', () async {
        final AlbumRepository repo = AlbumRepositoryImpl(
          AlbumLocalDataSourceImpl(),
        );

        expect(() async {
          await repo.getAlbums(limit: 101);
        }, throwsA(isA<Exception>()));
      });
    });
  });
}
