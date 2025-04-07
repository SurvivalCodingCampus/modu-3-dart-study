import 'package:modu_3_dart_study/2025-04-03/solution2/data_sourece/mock_photo_data_source_impl.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/model/photo.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/repository/photo_repository.dart';
import 'package:modu_3_dart_study/2025-04-03/solution2/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('[Photo Repository] - ', () {
    MockPhotoDataSourceImpl dataSource = MockPhotoDataSourceImpl();
    PhotoRepository repository = PhotoRepositoryImpl(dataSource);

    test('getAllPhotos() 테스트', () async {
      final photos = await repository.getAllPhotos();

      // Basic checks
      expect(photos, isNotEmpty);
      expect(photos.length, equals(6)); // Based on your JSON data

      // Verify data transformation
      final firstPhoto = photos[0];
      expect(firstPhoto.id, equals(1)); //1
      expect(firstPhoto.type, equals(ContentType.article)); //article
      expect(firstPhoto.title, equals('This is an article')); //This is an article
      expect(firstPhoto.createdAt.year, equals(2020)); //2020-01-01
    });

    test('type이 null 인경우 unknown', () async {
      final photos = await repository.getAllPhotos();
      final nullTypePhoto = photos.firstWhere((p) => p.id == 5 && p.url.contains('image.jpg'));
      expect(nullTypePhoto.type, equals(ContentType.unknown));
    });

    test('비어 있는 값도 에러 없이 처리해야 한다.', () async {
      final photos = await repository.getAllPhotos();
      final incompletePhoto = photos.firstWhere((p) => p.id == 3 && p.url.contains('video.mp4'));
      expect(incompletePhoto.title, isEmpty);
      expect(incompletePhoto.content, isEmpty);
    });
  });
}