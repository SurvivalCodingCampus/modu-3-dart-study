import 'package:test/test.dart';
import '../../assignments/2025-04-01/data_source/mock_album_data_source_impl.dart';
import '../../assignments/2025-04-01/model/album.dart';
import '../../assignments/2025-04-01/repository/album_repository_impl.dart';

void main() {
  final mockAlbumDataSource = MockAlbumDataSourceImple();
  group('예제5) albums', () {
    test('전체목록 가져오기', () async {
      final albumRepository = AlbumRepositoryImpl(mockAlbumDataSource);
      List<Album> albums = await albumRepository.getAlbums();

      expect(albums.length, 100);
      expect(albums[0].title, 'quidem molestiae enim');
      expect(albums[99].title, 'enim repellat iste');
    });

    test('제한된 데이터 가져오기', () async {
      final albumRepository = AlbumRepositoryImpl(mockAlbumDataSource);
      List<Album> albums = await albumRepository.getAlbums(limit: 10);

      expect(albums.length, 10);

      expect(albums[0].title, 'quidem molestiae enim');
      expect(albums[9].title, 'distinctio laborum qui');
    });
  });
}
