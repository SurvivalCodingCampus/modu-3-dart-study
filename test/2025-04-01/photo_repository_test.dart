import 'package:modu_3_dart_study/2025-04-01/data_source/local/photo_local_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/data_source/mock/mock_photo_datasource_impl.dart';
import 'package:modu_3_dart_study/2025-04-01/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/interface/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-01/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late PhotoRepository repository;

  const int albumIdWithPhotos = 1;
  const int albumIdWithNoPhotos = 999;

  setUp(() {
    // mock 데이터 사용 시
    repository = PhotoRepositoryImpl(MockPhotoDatasourceImpl());
    // 실제 로컬 파일 사용 시
    // repository = PhotoRepositoryImpl(PhotoLocalDatasourceImpl());
  });

  group('PhotoRepository 공통 테스트', () {
    test('albumId로 조회한 사진은 모두 해당 albumId여야 함', () async {
      final List<Photo> photos = await repository.getPhotos(albumIdWithPhotos);

      print('▶ 총 ${photos.length}개의 사진이 조회됨');
      for (final photo in photos) {
        print(
          ' - [id: ${photo.id}] albumId: ${photo.albumId}, title: ${photo.title}',
        );
      }

      expect(photos, isA<List<Photo>>());
      expect(photos.every((e) => e.albumId == albumIdWithPhotos), isTrue);

      print('✅ albumId 필터링 테스트 통과\n');
    });

    test('존재하지 않는 albumId는 빈 리스트를 반환해야 함', () async {
      final List<Photo> photos = await repository.getPhotos(
        albumIdWithNoPhotos,
      );

      print('▶ albumId: $albumIdWithNoPhotos에 대한 결과: ${photos.length}개');
      if (photos.isEmpty) {
        print('✅ 빈 리스트 확인 완료\n');
      } else {
        print('❌ 예상과 달리 결과가 존재함!');
        for (final p in photos) {
          print(' - [id: ${p.id}] albumId: ${p.albumId}, title: ${p.title}');
        }
      }

      expect(photos, isEmpty);
    });
  });
}
