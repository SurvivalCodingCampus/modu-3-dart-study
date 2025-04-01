import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_album_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/model/album.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/album_repository_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/interface/album_repository.dart';
import 'package:test/test.dart';

void main() {
  late AlbumRepository repository;

  const int limitCount = 5;

  setUp(() {
    repository = AlbumRepositoryImpl(MockAlbumDatasourceImpl());
    // repository = AlbumRepositoryImpl(AlbumLocalDatasourceImpl());
  });

  group('AlbumRepository 공통 테스트', () {
    test('limit 없이 호출하면 전체 앨범을 반환해야 함', () async {
      final albums = await repository.getAlbums();

      print('▶ 전체 앨범 수: ${albums.length}');
      for (final album in albums) {
        print(
          ' - [id: ${album.id}] title: ${album.title}, userId: ${album.userId}',
        );
      }

      expect(albums, isA<List<Album>>());

      print('✅ 전체 앨범 조회 테스트 통과\n');
    });

    test('limit을 지정하면 해당 개수만큼 반환되어야 함', () async {
      final limited = await repository.getAlbums(limit: limitCount);

      print('▶ limit = $limitCount 적용 결과: ${limited.length}개');
      for (final album in limited) {
        print(
          ' - [id: ${album.id}] title: ${album.title}, userId: ${album.userId}',
        );
      }

      expect(limited, isA<List<Album>>());
      expect(limited.length, limitCount);

      print('✅ limit 적용 테스트 통과\n');
    });
  });
}
