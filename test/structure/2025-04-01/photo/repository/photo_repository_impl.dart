import 'package:test/test.dart';
import '../../../../../lib/assignments/structure/2025-04-01/photo/data_source/local/photo_data_source_impl.dart';
import '../../../../../lib/assignments/structure/2025-04-01/photo/repository/mock/mock_photo_repository_impl.dart';
import '../../../../../lib/assignments/structure/2025-04-01/photo/repository/photo_repository.dart';
import '../../../../../lib/assignments/structure/2025-04-01/photo/repository/photo_repository_impl.dart';

void main() {
  group('photo repo test', () {
    test('photo mock repo test', () async {
      final PhotoRepository repo = MockPhotoRepositoryImpl();
      final photos = await repo.getPhotos(1);

      // 내부에 있는 객체의 albumId가 모두 1인지 확인
      expect(photos.length, equals(3));
    });

    test('photo repo test', () async {
      final PhotoRepository repo = PhotoRepositoryImpl(PhotoDataSourceImpl());
      final photos = await repo.getPhotos(1);

      print(photos[0].toString());

      // 내부에 있는 객체의 albumId가 모두 1인지 확인
      expect(
        photos.length == photos.where((e) => e.albumId == 1).toList().length,
        equals(true),
      );
    });
  });
}
