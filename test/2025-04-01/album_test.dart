import 'package:test/test.dart';

import '../../assignments/2025-04-01/album/data_source/impl/album_data_source_impl.dart';
import '../../assignments/2025-04-01/album/model/album.dart';
import '../../assignments/2025-04-01/album/repository/album_repository.dart';
import '../../assignments/2025-04-01/album/repository/impl/album_repository_impl.dart';

void main() {
  final AlbumRepository albumRepository = AlbumRepositoryImpl(
    AlbumDataSourceImpl(),
    Album(),
  );

  group('앨범 : ', () {
    test('전체 가져오기', () async {
      print(await albumRepository.getItems('albums.json'));
    });
    test('지정 수만큼 가져오기', () async {
      print(await albumRepository.getItemsByLimit('albums.json', limit: 2));
    });
  });
}
