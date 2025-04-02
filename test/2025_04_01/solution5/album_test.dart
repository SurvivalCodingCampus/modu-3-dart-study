import 'package:test/test.dart';

import '../../../assignments/2025_04_01/solution5/data_source/album_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution5/mock/mock_album_data_source_impl.dart';
import '../../../assignments/2025_04_01/solution5/repository/album_repository.dart';
import '../../../assignments/2025_04_01/solution5/repository/album_repository_impl.dart';

void main() {
  group('Data Source', () {
    final albumDataSourceImpl = AlbumDataSourceImpl();
    test('Data Source 제대로 잘 가져오는지 확인', () async {
      final result = await albumDataSourceImpl.getAlbums();

      print(result);

      expect(result.length, 100);
    });
  });

  group('Repository', () {
    final AlbumRepository albumRepository = AlbumRepositoryImpl(
      AlbumDataSourceImpl(),
    );
    test('limit 만큼 Album 가져오기', () async {
      final result = await albumRepository.getAlbums(limit: 5);

      print(result);

      expect(result.length, 5);
    });

    test('limit 이 없을 때 전체데이터 가져오기', () async {
      final result = await albumRepository.getAlbums();

      print(result);

      expect(result.length, 100);
    });
  });

  group('Mock Data', () {
    final AlbumRepository albumRepository = AlbumRepositoryImpl(
      MockAlbumDataSourceImpl(),
    );
    test('Mock length test', () async {
      final result = await albumRepository.getAlbums();

      print(result);

      expect(result.length, 7);
    });
  });
}
