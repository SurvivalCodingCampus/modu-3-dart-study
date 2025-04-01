import 'package:test/test.dart';

import '../../../../assignments/2025-04-01/src/solution/data_source/photo_data_source_impl.dart';
import '../../../../assignments/2025-04-01/src/solution/model/photo.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/photo_repository.dart';
import '../../../../assignments/2025-04-01/src/solution/repository/photo_repository_impl.dart';
import 'mock/mock_photo_data_source_impl.dart';

void main() {
  group('Photo', () {
    test('문제 2', () async {
      final PhotoRepository repository = PhotoRepositoryImpl(
        photoDataSource: PhotoDataSourceImpl(),
      );

      final expected =
          await MockPhotoDataSourceImpl()
              .getPhotos(); // albumId가 1인 photo만 담긴 리스트
      final result = await repository.getPhotos(1); // 전체 리스트에서 ambumId가 1인것만 추출

      for (int i = 0; i < expected.length; i++) {
        expect(result[i], isA<Photo>());
        expect(result[i].albumId, expected[i]['albumId']);
        expect(result[i].id, expected[i]['id']);
        expect(result[i].title, expected[i]['title']);
        expect(result[i].url, expected[i]['url']);
        expect(result[i].thumbnailUrl, expected[i]['thumbnailUrl']);
      }

      expect(result.length, expected.length);
    });
  });
}
