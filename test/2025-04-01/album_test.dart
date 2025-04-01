import 'package:test/test.dart';

import '../../assignments/2025-04-01/data_source/album_data_source.dart';
import '../../assignments/2025-04-01/data_source/album_data_source_impl.dart';
import '../../assignments/2025-04-01/model/album.dart';
import '../../assignments/2025-04-01/repository/album_repository_impl.dart';

void main() {
  group('Album 테스트', () {
    test('Mock 데이터 test', () async {
      String path = 'assignments/2025-04-01/data_source/mock_albums.json';
      AlbumDataSource albumDataSource = AlbumDataSourceImpl(path: path);
      AlbumRepositoryImpl albumRepository = AlbumRepositoryImpl(
        dataSource: albumDataSource,
      );
      await albumRepository.init();

      List<Album> allAlbums = albumRepository.getAlbums();
      expect(allAlbums.length, 1);
      expect(allAlbums[0].userId, 1);
      expect(allAlbums[0].id, 1);
      expect(allAlbums[0].title, 'test title');
    });

    test('본데이터 test', () async {
      String path = 'assignments/2025-04-01/data_source/albums.json';
      AlbumDataSource albumDataSource = AlbumDataSourceImpl(path: path);
      AlbumRepositoryImpl albumRepository = AlbumRepositoryImpl(
        dataSource: albumDataSource,
      );
      await albumRepository.init();

      List<Album> allAlbums = albumRepository.getAlbums();
      expect(allAlbums.length, 100);
    });
  });
}
