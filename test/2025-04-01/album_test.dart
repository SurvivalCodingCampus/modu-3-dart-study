import 'package:test/test.dart';

import '../../assignments/2025-04-01/album/model/album.dart';
import '../../assignments/2025-04-01/album/repository/album_repository.dart';
import '../../assignments/2025-04-01/album/repository/impl/album_repository_impl.dart';
import 'mock/mock_album_data_source.dart';

void main() {
  late MockAlbumDataSource albumDataSource;
  late AlbumRepository repository;
  late Album album;

  group('앨범 : ', () {
    setUpAll(() {
      albumDataSource = MockAlbumDataSource();
      album = Album();
      repository = AlbumRepositoryImpl(albumDataSource, album);

      albumDataSource.setMockData('albums.json', [
        {'userId': 1, 'id': 1, 'title': 'Album 1'},
        {'userId': 1, 'id': 2, 'title': 'Album 2'},
        {'userId': 2, 'id': 3, 'title': 'Album 3'},
      ]);
    });
    test('조회 실패', () async {
      expect(
        () async => await repository.getItemsByKey(1, 'albums2.json'),
        throwsA(isArgumentError),
      );
    });

    test('전체 조회', () async {
      final List<Album> albums = await repository.getItems('albums.json');

      expect(albums.length, 3);
      expect(albums[0].id, 1);
      expect(albums[0].title, 'Album 1');
    });

    test('key로 조회', () async {
      final List<Album> albums = await repository.getItemsByKey(
        1,
        'albums.json',
      );

      expect(albums.length, 2);
      expect(albums[0].userId, 1);
      expect(albums[1].userId, 1);
    });

    test('제한 조회', () async {
      final List<Album> albums = await repository.getItemsByLimit(
        'albums.json',
        limit: 2,
      );

      expect(albums.length, 2);
      expect(albums[0].id, 1);
      expect(albums[1].id, 2);
    });
  });
}
