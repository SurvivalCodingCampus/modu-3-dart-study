import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import '../../../../playground/apr/w1/2025-04-01/Album/data_source/mock_album_data_source_impl.dart';
import '../../../../playground/apr/w1/2025-04-01/Album/repository/album_repository_impl.dart';

void main() {
  test('album', () async {
    final albumRepository = AlbumRepositoryImpl(MockAlbumDataSourceImpl());
    final albumData = await albumRepository.getAlbums();
    final albumData5 = await albumRepository.getAlbums(limit: 5);

    expect(albumData.length, equals(100));
    expect(albumData5.length, equals(5));
  });
}
