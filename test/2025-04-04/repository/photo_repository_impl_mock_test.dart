import 'package:modu_3_dart_study/2025-04-04/data_source/mock_data_source/mock_error_mask_store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/data_source/mock_data_source/mock_mask_store_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/data_source/photo_data_source.dart';
import 'package:modu_3_dart_study/2025-04-04/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-04/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('PhotoRepositoryImpl 정상 데이터 테스트', () {
    late PhotoDataSource mockPhotoDataSource;
    late PhotoRepository photoRepository;

    setUp(() {
      mockPhotoDataSource = MockPhotoDataSourceImpl();
      photoRepository = PhotoRepositoryImpl(mockPhotoDataSource);
    });

    test('fetchPhotos()가 올바른 데이터 타입을 반환하는지 테스트', () async {
      // fetchPhotos() 호출
      final photos = await photoRepository.fetchPhotos();

      // 상수 선언
      const expectedLength = 3;

      // 결과 검증
      expect(photos, isA<List<Photo>>());
      expect(photos.length, expectedLength);

      // 데이터 로그 출력
      for (var photo in photos) {
        print(
          'Photo ID: ${photo.id}, Type: ${photo.type}, Title: ${photo.title}, CreatedAt: ${photo.createdAt}',
        );
      }
    });
  });

  group('PhotoRepositoryImpl 오류 데이터 테스트', () {
    late PhotoDataSource mockErrPhotoDataSource;
    late PhotoRepositoryImpl photoRepository;

    setUp(() {
      mockErrPhotoDataSource = MockErrPhotoDataSourceImpl();
      photoRepository = PhotoRepositoryImpl(mockErrPhotoDataSource);
    });

    test('fetchPhotos()가 오류 데이터를 처리하는지 테스트', () async {
      // fetchPhotos() 호출
      final photos = await photoRepository.fetchPhotos();

      // 상수 선언
      const expectedLength = 3;

      // 결과 검증
      expect(photos, isA<List<Photo>>());
      expect(photos.length, expectedLength);

      // 데이터 로그 출력
      for (var photo in photos) {
        print(
          'Photo ID: ${photo.id}, Type: ${photo.type}, Title: ${photo.title}, CreatedAt: ${photo.createdAt}',
        );
      }
    });
  });
}
