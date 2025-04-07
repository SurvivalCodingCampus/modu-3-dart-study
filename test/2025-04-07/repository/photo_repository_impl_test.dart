import 'package:modu_3_dart_study/2025-04-07/core/error.dart';
import 'package:modu_3_dart_study/2025-04-07/core/result.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-07/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

import '../mock_data_source/mock_photo_data_source_impl.dart';

void main() {
  group('PhotoRepositoryImpl', () {
    late PhotoRepository photoRepository;

    test('정상적인 사진 검색', () async {
      final query = '아이유';
      final int imgCount = 1;
      photoRepository = PhotoRepositoryImpl(MockPhotoDataSource());
      final result = await photoRepository.getPhotos(query);

      switch (result) {
        case Success(:final data):
          expect(data.length, imgCount);
        case Error():
          fail('정상 검색인데 에러가 발생하면 안 됨');
      }
    });

    test('비속어 사용 시 에러 발생', () async {
      final query = '바보';
      photoRepository = PhotoRepositoryImpl(MockPhotoDataSource());
      final result = await photoRepository.getPhotos(query);

      switch (result) {
        case Success():
          fail('비속어 검색인데 성공하면 안 됨');
        case Error(:final error):
          expect(error, ImageError.invalidWord);
      }
    });

    test('네트워크 에러 발생', () async {
      final query = '네트워크';
      photoRepository = PhotoRepositoryImpl(MockPhotoDataSourceWithError());
      final result = await photoRepository.getPhotos(query);

      switch (result) {
        case Success():
          fail('네트워크 에러인데 성공하면 안 됨');
        case Error(:final error):
          expect(error, ImageError.networkError);
      }
    });
  });
}
