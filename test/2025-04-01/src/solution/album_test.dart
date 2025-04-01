import 'package:test/test.dart';

import '../../../../assignments/2025-04-01/src/solution/data_source/album_data_source_impl.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/album_repository.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/album_repository_impl.dart';
import 'mock/mock_album_data_source_impl.dart';

void main() {
  group('Album', () {
    test('문제 5번 - limit 없는 경우', () async {
      final AlbumRepository repository = AlbumRepositoryImpl(
        albumDataSource: MockAlbumDataSourceImpl(),
      );

      final result = await repository.getAlbums();

      expect(result.length, 10);
    });

    test('문제 5번 - limit 있는 경우', () async {
      final AlbumRepository repository = AlbumRepositoryImpl(
        albumDataSource: AlbumDataSourceImpl(),
      );
      final int limit = 2;
      final result = await repository.getAlbums(limit: limit);

      expect(result.length, limit);
    });
  });
}
